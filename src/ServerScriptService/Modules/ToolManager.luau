local ToolController = {

}
ToolController.CurrentEquippedTools = {
	--["Player"] = ToolName,
}


local function DetectTool(player: Player, tool: Tool)
    -- Tool detection logic goes here
	if not tool:IsA("Tool") then return end
	-- Example: Print tool name
	print("Detected tool: " .. tool.Name)
	return tool
end

local function SetupConnection(player: Player, tool: Tool)
	local character = player.Character  or player.characterAdded:Wait()
	if not character then return end
	local humanoid  = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end
	if humanoid.Health <= 0 then return end
	if not tool then 
		warn("Tool Not Equipped For ", player) 
		return
	end
	local confirmedTool = ToolController.DetectTool(player, tool)
	if confirmedTool then
		ToolController.HandleToolEquipped(player, confirmedTool)
	end
end

local function HandleToolEquipped(player: Player, tool: Tool)
    -- Tool equipped handling logic goes here
	if ToolController.CurrentEquippedTools[player.Name] == tool.Name then
		print(player.Name .. " already has a tool equipped.")
		return
	else	
		--Create Player entry
		ToolController.CurrentEquippedTools[player.Name] = tool.Name
		print(player.Name .. " equipped " .. tool.Name)
	end
end


function ToolController:Init(player: Player)
    warn("Tool Manager")
	SetupConnection(player)
end

return ToolController




