--!strict
local controllers = game.ServerScriptService:WaitForChild("Controllers")
local modules = game.ServerScriptService:WaitForChild("Modules")

local function Initialize(parentFolder: Folder, scriptType: string?, ...: any)
	scriptType = scriptType or "Module"

	for _, v in pairs(parentFolder:GetChildren()) do
		if v:IsA("ModuleScript") then
			print("Requiring " .. scriptType .. " || ", v.Name)
			local newModule = require(v)

			if typeof(newModule.Init) == "function" then
				print("Initializing " .. scriptType .. " || ", v.Name)
				newModule:Init(...)
				print("Initialized " .. scriptType .. " || ", v.Name)
			end
		end
	end
end


--Main Game Loop
Initialize(controllers, "Controller")

game.Players.PlayerAdded:Connect(function(player: Player) 
	Initialize(modules, "Module", player)
end)
	
