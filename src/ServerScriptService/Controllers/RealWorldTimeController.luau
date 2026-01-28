local timeConfiguration = require(game.ReplicatedStorage.Modules.RealWorldTimeConfiguration)
local syncedTime = timeConfiguration.init()

local RWTController = {}

-- Helper: Convert seconds to HH:MM:SS
local function toHMS(s)
    return string.format("%02i:%02i:%02i", math.floor(s / 3600), math.floor(s / 60) % 60, s % 60)
end

-- Get current synced time from the module
function RWTController:GetTime()
    return timeConfiguration.time()
end

-- Initialize the controller
function RWTController:Init()
    print(self:GetTime()) 
end

return RWTController