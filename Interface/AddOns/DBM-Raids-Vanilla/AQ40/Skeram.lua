local isClassic = WOW_PROJECT_ID == (WOW_PROJECT_CLASSIC or 2)
local isBCC = WOW_PROJECT_ID == (WOW_PROJECT_BURNING_CRUSADE_CLASSIC or 5)
local catID
if isBCC or isClassic then
	catID = 2
else--retail or wrath classic and later
	catID = 1
end
local mod	= DBM:NewMod("Skeram", "DBM-Raids-Vanilla", catID)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20240115231835")
mod:SetCreatureID(15263)
mod:SetEncounterID(709)
if not mod:IsClassic() then
	mod:SetModelID(15345)
end
mod:SetUsedIcons(4, 5, 6, 7, 8)
mod:DisableBossDeathKill()
mod:SetHotfixNoticeRev(20210522000000)--2021-05-22
mod:SetMinSyncRevision(20210522000000)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 785",
	"SPELL_AURA_REMOVED 785",
	"SPELL_CAST_SUCCESS 20449 4801 8195",
	"SPELL_SUMMON 747",
	"UNIT_HEALTH"
)

--TODO, special warning optimizing?
local warnMindControl	= mod:NewTargetAnnounce(785, 4)
local warnTeleport		= mod:NewSpellAnnounce(20449, 3)
local warnSummon		= mod:NewSpellAnnounce(747, 3)
local warnSummonSoon	= mod:NewSoonAnnounce(747, 2)

local timerMindControl	= mod:NewBuffActiveTimer(20, 785, nil, nil, nil, 3)

mod:AddSetIconOption("SetIconOnMC", 785, true, false, {4, 5, 6, 7, 8})

local MCTargets = {}
mod.vb.splitCount = 0
mod.vb.MCIcon = 8

function mod:OnCombatStart(delay)
	self.vb.splitCount = 0
	table.wipe(MCTargets)
	self.vb.MCIcon = 8
end

local function warnMCTargets(self)
	warnMindControl:Show(table.concat(MCTargets, "<, >"))
	timerMindControl:Start()
	table.wipe(MCTargets)
	self.vb.MCIcon = 8
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpell(785) then
		MCTargets[#MCTargets + 1] = args.destName
		self:Unschedule(warnMCTargets)
		if self.Options.SetIconOnMC then
			self:SetIcon(args.destName, self.vb.MCIcon)
		end
		if #MCTargets >= 3 then
			warnMCTargets(self)
		else
			self:Schedule(0.5, warnMCTargets, self)
		end
		self.vb.MCIcon = self.vb.MCIcon - 1
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpell(785) and self.Options.SetIconOnMC then
		self:SetIcon(args.destName, 0)
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpell(20449, 4801, 8195) and args:IsSrcTypeHostile() and self:AntiSpam(3, 1) then
		warnTeleport:Show()
	end
end

function mod:SPELL_SUMMON(args)
	if args:IsSpell(747) and self:AntiSpam(3, 2) then
		warnSummon:Show()
	end
end

function mod:UNIT_HEALTH(uId)
	if self:GetUnitCreatureId(uId) == 15263 then
		local percent = UnitHealth(uId) / UnitHealthMax(uId) * 100
		if percent <= 81 and percent >= 77 and self.vb.splitCount < 1 then
			warnSummonSoon:Show()
			self.vb.splitCount = 1
		elseif percent <= 56 and percent >= 52 and self.vb.splitCount < 2 then
			warnSummonSoon:Show()
			self.vb.splitCount = 2
		elseif percent <= 31 and percent >= 27 and self.vb.splitCount < 3 then
			warnSummonSoon:Show()
			self.vb.splitCount = 3
		end
	end
end
