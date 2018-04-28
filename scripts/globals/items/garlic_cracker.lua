-----------------------------------------
-- ID: 4467
-- Item: garlic_cracker
-- Food Effect: 3Min, All Races
-----------------------------------------
-- HP Regen While Healing 6
-- Undead Killer 10
-- Blind Resist 10
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,4467);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HPHEAL, 6);
    target:addMod(dsp.mod.UNDEAD_KILLER, 10);
    target:addMod(dsp.mod.BLINDRES, 10);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HPHEAL, 6);
    target:delMod(dsp.mod.UNDEAD_KILLER, 10);
    target:delMod(dsp.mod.BLINDRES, 10);
end;
