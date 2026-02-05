local TestTool = {

    Damage = 10,
    Range = 5,
    Cooldown = 1,
    Name = "TestTool",
    CanBreak = {
        "Dirt", "Stone", "Iron Ore", "Gold Ore",
    },
    Durability = 100,
}

function TestTool.OnActivated(player: Player, tool: Tool)
    print(player.Name .. " activated " .. tool.Name)
    local toolStats = TestTool
    if not toolStats then
        warn("No stats found for tool please check above table for " .. tool.Name)
        return
    end
    print("Damage: "..toolStats.Damage..", Range: "..toolStats.Range)
end

return TestTool