local MobModule = {

}
--Helpers
local function getRandomSpawnLocation(player: Player)
    local location = nil
    --find player base
        --find the bases spawn radius
    --generate random location within radius
        --return location
    return location
end
function MobModule:SpawnMob(mobName: string, location: CFrame, mutation: string, level: number)
    if not mutation then
        mutation = "Default"
    end

    if not level then
        level = 1
    end

    if not location then
        location = getRandomSpawnLocation(player)
    end

end

function MobModule:Init(player: Player)
--start mob spawning sequence for player
warn("Test Module")
end

return MobModule  