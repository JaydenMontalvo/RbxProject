local ServerScriptService = game:GetService("ServerScriptService")
local ToolController = {}

ToolController.CurrentEquippedTools = {} -- [player] = Tool
ToolController.ToolConnections = {} -- [tool] = RBXScriptConnection

local function isValidTool(player: Player, tool: Instance): Tool?
	if not tool or not tool:IsA("Tool") then return nil end

	local character = player.Character
	if not character then return nil end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid or humanoid.Health <= 0 then return nil end

	return tool
end

function ToolController:HandleToolEquipped(player: Player, tool: Tool)
if self.CurrentEquippedTools[player] == tool then return end


-- cleanup old
local oldTool = self.CurrentEquippedTools[player]
if oldTool and self.ToolConnections[oldTool] then
self.ToolConnections[oldTool]:Disconnect()
self.ToolConnections[oldTool] = nil
end


self.CurrentEquippedTools[player] = tool


self.ToolConnections[tool] = tool.Activated:Connect(function()

	local toolModule = require(ServerScriptService.Modules.Tools[tool.Name])
	print("Found tool module for " .. tool.Name)
	toolModule.OnActivated(player, tool)
	print(player.Name .. " used " .. tool.Name)
end)
end

function ToolController:HandleToolUnequipped(player: Player, tool: Tool)
	if self.CurrentEquippedTools[player] ~= tool then return end
	self.CurrentEquippedTools[player] = nil
	print(player.Name .. " unequipped " .. tool.Name)
end

function ToolController:Init(player: Player)
	player.CharacterAdded:Connect(function(character)
		character.ChildAdded:Connect(function(child)
			local tool = isValidTool(player, child)
			if tool then
				self:HandleToolEquipped(player, tool)
			end
		end)

		character.ChildRemoved:Connect(function(child)
			local tool = isValidTool(player, child)
			if tool then
				self:HandleToolUnequipped(player, tool)
			end
		end)
	end)
end

return ToolController