--!strict
local modules = game.ServerScriptService:WaitForChild("Modules")

--Initialize all modules
for _,v in pairs (modules:GetChildren()) do
    if v:IsA("ModuleScript") then
        print("Requiring Module || ", v.Name)
        local newModule = require(v)
        --Init function
         print("Initializing Module || ", v.Name)
        newModule:Init()
         print("Initialized Module || ", v.Name)
    end
end