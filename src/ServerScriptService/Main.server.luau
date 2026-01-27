--!strict
local controllers = game.ServerScriptService:WaitForChild("Controllers")
local modules = game.ServerScriptService:WaitForChild("Modules")

local function Initialize(parentFolder: Folder, scriptType: string)
    for _,v in pairs (parentFolder:GetChildren()) do
    if v:IsA("ModuleScript") then
       scriptType = scriptType or "Module"
       print("Requiring " .. scriptType .. " || ", v.Name)
        local newModule = require(v)
        --Init function
        print("Initializing " .. scriptType .. " || ", v.Name)
        newModule:Init()
        print("Initialized " .. scriptType .. " || ", v.Name)
    end
end
end


--Main Game Loop
Initialize(controllers, "Controller")
Initialize(modules, "Module")