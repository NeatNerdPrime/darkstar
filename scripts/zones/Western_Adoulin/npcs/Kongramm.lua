-----------------------------------
-- Area: Western Adoulin
--  NPC: Kongramm
-- Type: Standard NPC, Mission NPC, and Quest NPC
--  Involved with Mission: 'A Curse From The Past'
--  Involved with Quests: 'A Certain Substitute Patrolman' and 'Transporting'
-- !pos 61 32 138 256
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/keyitems");

local quest_table =
{
    require("scripts/quests/adoulin/a_certain_substitute_patrolman")
}
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local SOA_Mission = player:getCurrentMission(SOA);
    local Transporting = player:getQuestStatus(ADOULIN, TRANSPORTING);

    if ((SOA_Mission == A_CURSE_FROM_THE_PAST) and (not player:hasKeyItem(dsp.ki.PIECE_OF_A_STONE_WALL))) then
        if (player:getVar("SOA_ACFTP_Kongramm") < 1) then
            -- Gives hint for SOA Mission: 'A Curse From the Past'
            player:startEvent(148);
        else
            -- Reminds player of hint for SOA Mission: 'A Curse From the Past'
            player:startEvent(149);
        end
    else
        if not dsp.quests.onTrigger(player, npc, quest_table) then
            if ((Transporting == QUEST_ACCEPTED) and (player:getVar("Transporting_Status") < 1)) then
                -- Progresses Quest: 'Transporting'
                player:startEvent(2592);
            else
                -- Standard dialogue
                player:startEvent(558);
            end
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if not dsp.quests.onEventFinish(player, csid, option, quest_table) then
        if (csid == 148) then
            -- Gave hint for SOA Mission: 'A Curse From the Past'
            player:setVar("SOA_ACFTP_Kongramm", 1);
        elseif (csid == 2592) then
            -- Progresses Quest: 'Transporting'
            player:setVar("Transporting_Status", 1);
        end
    end
end;
