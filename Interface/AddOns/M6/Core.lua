local private, pub, hum, conf, addonName, T = {}, {}, {}, nil, ...
local MODERN = select(4,GetBuildInfo()) >= 10e4
local CF_WRATH = not MODERN and select(4,GetBuildInfo()) >= 3e4
local TB_THRESH

local function writeArray(t, n, i, a, ...)
	if n > 0 then
		t[i] = a
		return writeArray(t, n-1, i+1, ...)
	end
end
local function nextAction(_, okey)
	local k, v = next(conf.actions, okey)
	return k, v and v.name or nil
end
local function nextGroup(_, okey)
	local k, v = next(conf.groups, okey)
	if type(k) == "number" then
		return k,v
	elseif k then
		return nextGroup(_, k)
	end
end
local safequote do
	local r = {u="\\117", ["{"]="\\123", ["}"]="\\125"}
	function safequote(s)
		return s and (("%q"):format(s):gsub("[{u}]", r)) or 'nil'
	end
end
local GetSpecialization = GetSpecialization or CF_WRATH and GetActiveTalentGroup or function() return 1 end
local function copy(t, lib)
	local r = {}
	if type(t) == "table" then
		lib[t] = r
		for k,v in pairs(t) do
			r[lib[k] or type(k) == "table" and copy(k, lib) or k] =
			  lib[v] or type(v) == "table" and copy(v, lib) or v
		end
	end
	return r
end
local function getTimeBand(a,b, c,d)
	local t, p = GetServerTime()
	if t >= d then
		return 2
	elseif DEV_EARLY_WARNING or t >= b and t <= c then
		return 1
	elseif t <= a then
		return 0
	end
	TB_THRESH = TB_THRESH or math.random(127)/128
	p = t > c and (t-c)/(d-c) or ((t-a)/(b-a))
	return (t > b and 1 or 0) + (p^3 > TB_THRESH and 1 or 0)
end

local EV, AB, RW, KR, IM = T.Evie do
	-- NB: Skip's version checks need to stay as recent as these
	AB = T.ActionBook:compatible(2, 38)
	RW = T.ActionBook:compatible("Rewire", 1, 25)
	KR = T.ActionBook:compatible("Kindred", 1, 19)
	IM = T.ActionBook:compatible("Imp", 1, 4)
	assert(AB and RW and KR and IM, "ActionBook is missing or incompatible")
	hum.HUM, hum.ActionBook = hum, T.ActionBook
	hum.ext = {ActionBook = T.ActionBook} -- DEPRECATED
end

local core = T.TenSABT(CreateFrame("Button", "M6Prime", nil, "SecureActionButtonTemplate,SecureHandlerBaseTemplate"))
core:SetFrameRef("RW", RW:seclib())
core:SetFrameRef("AB", AB:seclib())
core:SetFrameRef("KR", KR:seclib())
core:Execute([=[--m6_core_init 
	AB, RW, KR = self:GetFrameRef("AB"), self:GetFrameRef("RW"), self:GetFrameRef("KR")
	macros, bound, binding = newtable(), newtable(), newtable()
]=])
core:SetAttribute("type", "macro")
core:WrapScript(core, "OnClick", [=[--m6_onclick_pre 
	local mtext, mlock = macros[button], false
	if not mtext then
		mtext, mlock = bound[button], KR:RunAttribute("ComputeConditionalLock", binding[button], "1", nil)
	else
		mlock = KR:RunAttribute("ComputeConditionalLock", false, true, nil)
	end
	self:SetAttribute("macrotext", RW:RunAttribute("RunMacro", mtext, false, mlock))
]=])
core:WrapScript(core, "OnAttributeChanged", [=[--m6_onattributechanged_pre 
	local bid = type(name) == "string" and name:match("^binding%-(.+)")
	if bid then
		binding[bid] = value
	end
]=])
local coreEnv = GetManagedEnvironment(core)

local function getActionMacroText(ac)
	local at = ac and ac[1]
	if at == "macrotext" then
		return ac[2]
	elseif at == "imptext" then
		return IM:DecodeTokens(ac[2])
	end
end

local namedSet, pushName = {} do
	local queue, ownerToken = {}, RW:RegisterNamedMacroTextOwner("M6", 20)
	local function procNamedQueue()
		local id
		for name in pairs(queue) do
			id, queue[name] = namedSet[name], nil
			pushName(name, id and getActionMacroText(conf.actions[id]), id)
		end
		return "remove"
	end
	function pushName(name, macro, id)
		namedSet[name] = id
		if InCombatLockdown() then
			if not next(queue) then
				EV.PLAYER_REGEN_ENABLED = procNamedQueue
			end
			queue[name] = 1
		else
			macro = macro and id and (macro  .. "\n#m6macroid " .. id) or macro
			RW:SetNamedMacroText(name, macro, ownerToken)
		end
	end
	RW:SetMetaHintFilter("m6macroid", "macroFallback", false, function(_meta, id)
		local a = conf.actions[tonumber(id)]
		local ico = a and a.icon
		return ico and 2 or true, nil, ico, a and a.name
	end)
end

local activeActionIDs, activeChar, activeSet, switchSet, newMacro, syncSet = {} do
	local satBindingButtons, pending, pending2 = {}
	local function pushMacro(key, text)
		core:Execute(("macros[%s] = %s"):format(safequote(key), text and safequote(text) or "nil"))
		if text then
			local mk = "_M6+" .. key
			if not GetMacroInfo(mk) then
				CreateMacro(mk, "Temp", "#temp", not not GetMacroInfo(120))
			end
			EditMacro(mk, mk, private:GetKeyIcon(key), ("#showtooltip\n#m6\n/click %s %s"):format(core:GetName(), key))
		end
	end
	local escapeBindConditionalChars = {[';']='SEMICOLON', ['[']='OPEN', [']']='CLOSE'}
	local function pushActiveSet()
		wipe(activeActionIDs)
		for sid, aid in pairs(activeSet.slots) do
			activeActionIDs[aid] = sid
		end
		if InCombatLockdown() then
			pending = pending or EV.RegisterEvent("PLAYER_REGEN_ENABLED", pushActiveSet) or true
			return
		end
		pending = nil
		for k in rtable.pairs(coreEnv.bound) do
			KR:UnregisterBindingDriver(core, k)
		end
		core:Execute([=[wipe(macros) wipe(bound) wipe(binding)]=])
		for k,v in pairs(activeSet.slots) do
			local mt = getActionMacroText(conf.actions[v])
			if mt then
				pushMacro(k, mt)
			end
		end
		local bindSet = activeSet.bind
		for k,ac in pairs(conf.actions) do
			local bind, name = bindSet[k] == nil and ac.globalBind or bindSet[k], ac.name
			local mt = (bind or name) and getActionMacroText(ac) or nil
			if bind and mt then
				local bkey = 'b' .. k
				if not bind:match("%[.*%]") then
					bind = bind:gsub('[^-]+$', escapeBindConditionalChars)
				end
				core:Execute(('bound[%s] = %s'):format(safequote(bkey), safequote(mt)))
				local bb = satBindingButtons[bkey]
				if not bb then
					bb = CreateFrame("Button", "M6Bind!" .. bkey, nil, "SecureActionButtonTemplate")
					bb:SetAttribute("type", "click")
					bb:SetAttribute("clickbutton", core)
					satBindingButtons[bkey] = bb
				end
				if MODERN then
					-- Let the 10.0-broken SABT drop one of these
					bb:RegisterForClicks("AnyDown", "AnyUp")
				else
					bb:RegisterForClicks("AnyUp", "AnyDown")
				end
				KR:RegisterBindingDriver(bb, bkey, bind .. ";", -20, core)
			end
			if name then
				pushName(name, mt, k)
			end
		end
		EV("M6_ACTIVE_SET_CHANGED")
		return "remove"
	end
	function newMacro(action)
		local id = 1
		while activeSet.slots[("s%02x"):format(id)] do
			id = id + 1
		end
		local k = ("s%02x"):format(id)
		activeSet.slots[k], activeActionIDs[action] = action, k;
		(InCombatLockdown() and pushActiveSet or pushMacro)(k, getActionMacroText(conf.actions[action]))
		return "_M6+" .. k, k
	end
	function switchSet(id)
		id = id or 1
		activeSet = type(activeChar[id]) == "table" and activeChar[id] or {}
		activeChar[id] = activeSet
		if type(activeSet.slots) ~= "table" then
			activeSet.slots = {}
		end
		if type(activeSet.bind) ~= "table" then
			activeSet.bind = {}
		end
		if IsLoggedIn() then
			pushActiveSet()
		else
			EV.PLAYER_LOGIN = pushActiveSet
		end
	end
	local function switchToCurrentSpec()
		switchSet(GetSpecialization())
	end
	EV.PLAYER_SPECIALIZATION_CHANGED, EV.PLAYER_ENTERING_WORLD = switchToCurrentSpec, switchToCurrentSpec
	if CF_WRATH then
		EV.ACTIVE_TALENT_GROUP_CHANGED = switchToCurrentSpec
	end
	local function bucketPushActiveSet()
		if pending2 then
			pending2 = nil
			return pushActiveSet()
		end
	end
	function EV:SPELLS_CHANGED()
		if not (pending2 or pending and InCombatLockdown()) then
			pending2 = true
			C_Timer.After(0, bucketPushActiveSet)
		end
	end
	EV.PLAYER_REGEN_DISABLED = bucketPushActiveSet
	syncSet = pushActiveSet
end

function EV:ADDON_LOADED(addon)
	if addon ~= addonName then return end
	
	local oc = type(M6DB) == "table" and M6DB
	conf = {}
	for k in ("actions profiles groups"):gmatch("%S+") do
		conf[k] = copy(oc and oc[k], {})
	end
	conf.icRangeColor = type(oc and oc.icRangeColor) == "string" and oc.icRangeColor:match("^%x%x%x%x%x%x$") or "ffffff"
	conf.icManaColor = type(oc and oc.icManaColor) == "string" and oc.icManaColor:match("^%x%x%x%x%x%x$") or "8080ff"
	local tb = conf._TimeBand
	TB_THRESH = type(tb) == "number" and tb < 1 and tb >= 0 and tb or TB_THRESH or nil
	
	local realm, name, spec = GetRealmName(), UnitName("player"), GetSpecialization()
	local rt = type(conf.profiles[realm]) == "table" and conf.profiles[realm] or {}
	M6DB, activeChar = nil, type(rt[name]) == "table" and rt[name] or {}
	conf.profiles[realm], rt[name] = rt, activeChar
	switchSet(spec)
	EV("M6_READY", conf)
	
	return "remove"
end
function EV:PLAYER_LOGOUT()
	M6DB = conf or M6DB
	for _,v in pairs(conf.profiles) do
		if v.slots and not next(v.slots) then
			v.slots = nil
		end
		if v.bind and not next(v.bind) then
			v.bind = nil
		end
		if not next(v) then
			conf.profiles[v] = nil
		end
	end
	conf._TimeBand = TB_THRESH
	local FM = AB and AB:compatible("FlagMast", 1)
	local fs = FM and FM:GetState()
	M6PC = fs and {FlagState=fs} or nil
end
function EV:PLAYER_ENTERING_WORLD(_, isReload)
	if isReload and type(M6PC) == "table" and type(M6PC.FlagState) == "table" then
		local FM = AB and AB:compatible("FlagMast", 1)
		if FM then
			FM:RestoreState(M6PC.FlagState)
		end
	end
	M6PC = nil
	return "remove"
end

local function handleGroupEntryRemoval(gid)
	for _,v in pairs(conf.actions) do
		if v.group == gid then
			return
		end
	end
	local gn = conf.groups[gid]
	conf.groups[gid] = nil
	if gn and conf.groups[gn] == gid then
		conf.groups[gn] = nil
	end
end
local function swapHintIcon(ico, u, s, _ico, ...)
	return u, s, ico, ...
end

-- These support the M6 editor UI
private.pub = pub
function private:NewAction(...)
	local k = #conf.actions + 1
	conf.actions[k] = {...}
	return k
end
function private:PickupAction(id)
	if not conf.actions[id] then
		return
	elseif InCombatLockdown() then
		UIErrorsFrame:AddMessage(ERR_AFFECTING_COMBAT, 1, 0.125, 0.125)
		return
	end
	for k,v in pairs(activeSet.slots) do
		if v == id then
			PickupMacro("_M6+" .. k, k)
			return
		end
	end
	PickupMacro(newMacro(id))
end
function private:GetAction(id)
	return unpack(conf.actions[id])
end
function private:SetAction(id, ...)
	local at, ac = conf.actions[id], select("#", ...)
	if ac > 4 then
		writeArray(conf.actions[id], ac, 1, ...)
	else
		at[1], at[2], at[3], at[4] = ...
	end
	syncSet()
	local name = conf.actions[id].name
	if name then
		pushName(name, name and getActionMacroText(at), id)
	end
end
function private:GetActionName(id)
	return conf.actions[id].name
end
function private:SetActionName(id, name)
	name = type(name) == "string" and name:match("^%s*(%S.-)%s*$") or nil
	local oid, su, base, oname = namedSet[name], 1, name, conf.actions[id].name
	while oid and oid ~= id do
		name, su = base .. "-" .. su, su + 1
		oid = namedSet[name]
	end
	conf.actions[id].name = name
	if name then
		pushName(name, name and getActionMacroText(conf.actions[id]), id)
	end
	if oname and oname ~= name then
		pushName(oname, nil, nil)
	end
	return base == name
end
function private:SetActionBind(id, bind, forAll)
	local globBind, changed = conf.actions[id].globalBind, false
	bind = type(bind) == "string" and bind ~= "" and bind or nil
	if bind == globBind then
		if not forAll then
			changed, conf.actions[id].globalBind = 1, nil
		else
			bind = nil
		end
	elseif forAll then
		conf.actions[id].globalBind, changed, bind = bind or nil, 1
	end
	
	if bind then
		for k,v in pairs(activeSet.bind) do
			if v == bind then
				changed, activeSet.bind[k] = 1
			end
		end
	end
	
	if activeSet.bind[id] ~= bind then
		activeSet.bind[id], changed = bind, 1
	end
	if changed then
		syncSet()
	end
end
function private:GetActionBind(id)
	local lbind = activeSet.bind[id]
	local gbind = conf.actions[id]
	gbind = gbind and conf.actions[id].globalBind
	return lbind == nil and gbind or lbind, lbind ~= nil, gbind
end
function private:SetActionIcon(id, ico)
	conf.actions[id].icon = (type(ico) == "string" or type(ico) == "number") and ico or nil
end
function private:GetActionIcon(id)
	return conf.actions[id].icon
end
function private:SetActionGroup(id, group)
	group = type(group) == "string" and group:match("(%S.-)%s*$") or nil
	local gid, ogid = conf.groups[group], conf.actions[id].group
	if group and not gid then
		gid = #conf.groups+1
		conf.groups[gid], conf.groups[group] = group, gid
	end
	conf.actions[id].group = gid
	if ogid and ogid ~= gid then
		handleGroupEntryRemoval(ogid)
	end
end
function private:GetActionGroup(id)
	local gid = conf.actions[id].group
	return conf.groups[gid], gid
end
function private:IsActionActivated(id)
	return activeActionIDs[id] ~= nil
end
function private:DeactivateAction(id)
	for k,v in pairs(activeSet.slots) do
		if v == id then
			activeSet.slots[k] = nil
			syncSet()
			return
		end
	end
end
function private:DeleteAction(id)
	local ogid = conf.actions[id] and conf.actions[id].group
	conf.actions[id] = nil
	for _,v in pairs(conf.profiles) do
		for _,t in pairs(v) do
			local slots = t.slots
			if slots then
				for s,a in pairs(slots) do
					if a == id then
						slots[s] = nil
					end
				end
			end
			if t.bind then
				t.bind[id] = nil
			end
		end
	end
	if ogid then
		handleGroupEntryRemoval(ogid)
	end
	syncSet()
end
function private:GetGroupID(group)
	return conf.groups[group]
end
function private:AllActions()
	return nextAction
end
function private:AllGroups()
	return nextGroup
end
function private:GetHint(key)
	local macro = coreEnv.macros[key]
	local ai = conf.actions[activeSet.slots[key]]
	if macro then
		local ico = ai and ai.icon
		if ico then
			return ai and ai.name, swapHintIcon(ico, RW:GetMacroAction(macro))
		end
		return ai and ai.name, RW:GetMacroAction(macro)
	end
end
function private:IsActionValid(id)
	return conf.actions[id] ~= nil
end

local keyIconCache, iconKeyCache = {}, {} do
	local base = 2^30 + 42e4
	for i=0,255 do
		local iid, key = base + i, ("s%02x"):format(i)
		iconKeyCache[iid], keyIconCache[key] = key, iid
	end
end
function private:GetIconKey(icon)
	return iconKeyCache[icon]
end
function private:GetKeyIcon(key)
	return keyIconCache[key]
end

local function findTableKey(t, k)
	if type(t) ~= "table" then
		return
	end
	local r = t[k]
	if r then
		return r, k
	end
	for k2, v2 in pairs(t) do
		if strcmputf8i(k, k2) == 0 then
			return v2, k2
		end
	end
end
function private:HasProfile(character, realm, spec)
	local t = conf.profiles
	if realm == nil and type(t) == "table" then
		for k, v in pairs(t) do
			local ct, ck = findTableKey(v, character)
			if ct and type(ct) == "table" then
				if realm then
					return nil, ck
				end
				realm = k
			end
		end
	end
	t, realm = findTableKey(t, realm)
	t, character = findTableKey(t, character)
	t = type(t) == "table" and t[spec]
	if t then
		return realm, character
	end
end
local function replaceProfiledElement(ek, character, realm, spec)
	local t, d = conf.profiles, activeSet[ek]
	t = type(t) == "table" and t[realm]
	t = type(t) == "table" and t[character]
	t = type(t) == "table" and t[spec]
	if t and t ~= activeSet then
		wipe(d)
		if t[ek] then
			for k, v in pairs(t[ek]) do
				d[k] = v
			end
		end
		syncSet()
		return true
	end
end
function private:ReplaceProfileMap(character, realm, spec)
	return replaceProfiledElement("slots", character, realm, spec)
end
function private:ReplaceProfileBindings(character, realm, spec)
	return replaceProfiledElement("bind", character, realm, spec)
end
function private:FutureDeprecationError(msg, depth, a,b,c,d)
	local sev = getTimeBand(a,b,c,d)
	if sev == 2 then
		error(msg, 1 + (depth or 1))((0)[0])
	elseif sev == 1 then
		securecall(error, msg, 2 + (depth or 1))
	end
end

pub.GetIconKey = private.GetIconKey
pub.GetHint = private.GetHint
function pub:RegisterButtonUpdateListener(callback)
	assert(type(callback) == "function", 'Syntax: M6:RegisterButtonUpdateListener(callback)')
	EV.M6_BUTTON_UPDATE, EV.M6_BUTTON_RELEASE = callback, callback
	EV("M6_EXTERNAL_LISTENER_ADDED")
end

-- HIDDEN, UNSUPPORTED METHODS: may vanish in the future
setmetatable(pub, {__index=hum})
hum.PainterEvents = newproxy(true) do
	local meta = getmetatable(hum.PainterEvents)
	function meta:__newindex(k, v)
		if k == "RawActionBookUpdates" and type(v) == "function" then
			pub:RegisterForButtonUpdates(v)
		else
			error("Invalid assignment", 2)
		end
	end
end

T.FutureDeprecationError = private.FutureDeprecationError
T.M6Core, _G.M6 = private, pub