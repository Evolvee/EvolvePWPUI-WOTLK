local isClassic = WOW_PROJECT_ID == (WOW_PROJECT_CLASSIC or 2)
local isBCC = WOW_PROJECT_ID == (WOW_PROJECT_BURNING_CRUSADE_CLASSIC or 5)
local isWrath = WOW_PROJECT_ID == (WOW_PROJECT_WRATH_CLASSIC or 11)
local catID
if isWrath then
	catID = 5
elseif isBCC or isClassic then
	catID = 6
else--retail or cataclysm classic and later
	catID = 4
end
local mod	= DBM:NewMod("Sulfuron", "DBM-Raids-Vanilla", catID)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20230814031337")
mod:SetCreatureID(12098)--, 11662
mod:SetEncounterID(669)
mod:SetModelID(13030)
mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 19779 19780 19776 20294",
	"SPELL_AURA_REMOVED 19779",
	"SPELL_CAST_START 19775"
)

--TODO, nameplate aura if classic API supports it enough
local warnInspire		= mod:NewTargetNoFilterAnnounce(19779, 2, nil, "Tank|Healer")
local warnHandRagnaros	= mod:NewTargetAnnounce(19780, 2, nil, false, 2)
local warnShadowPain	= mod:NewTargetAnnounce(19776, 2, nil, false, 2)
local warnImmolate		= mod:NewTargetAnnounce(20294, 2, nil, false, 2)

local specWarnHeal		= mod:NewSpecialWarningInterrupt(19775, "HasInterrupt", nil, nil, 1, 2)

local timerInspire		= mod:NewTargetTimer(10, 19779, nil, "Tank|Healer", nil, 5, nil, DBM_COMMON_L.TANK_ICON..DBM_COMMON_L.HEALER_ICON)
local timerHeal			= mod:NewCastTimer(2, 19775, nil, nil, 2, 4, nil, DBM_COMMON_L.INTERRUPT_ICON)

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpell(19779) then
		warnInspire:Show(args.destName)
		timerInspire:Start(args.destName)
	elseif args:IsSpell(19780) and args:IsDestTypePlayer() then
		warnHandRagnaros:CombinedShow(0.3, args.destName)
	elseif args:IsSpell(19776) and args:IsDestTypePlayer() then
		warnShadowPain:CombinedShow(0.3, args.destName)
	elseif args:IsSpell(20294) and args:IsDestTypePlayer() then
		warnImmolate:CombinedShow(0.3, args.destName)
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpell(19779) then
		timerInspire:Stop(args.destName)
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpell(19775) and args:IsSrcTypeHostile() and self:CheckInterruptFilter(args.sourceGUID, false, true) then--Only show warning/timer for your own target.
		timerHeal:Start()
		specWarnHeal:Show(args.sourceName)
		specWarnHeal:Play("kickcast")
	end
end
