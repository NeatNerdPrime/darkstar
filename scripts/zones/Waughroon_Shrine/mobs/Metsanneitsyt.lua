-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Metsanneitsyt
-- BCNM: Grove Guardians
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.SLEEPRES, 50)
end

function onMobDeath(mob, player, isKiller)
end
