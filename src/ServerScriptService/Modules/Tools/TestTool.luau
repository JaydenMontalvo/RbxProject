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
end

return TestTool