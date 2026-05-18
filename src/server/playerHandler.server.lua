-- Player Handler Script
-- Manages player-related events and logic

local Players = game:GetService("Players")

local PlayerHandler = {}

function PlayerHandler:Init()
    Players.PlayerAdded:Connect(function(player)
        self:OnPlayerJoined(player)
    end)
end

function PlayerHandler:OnPlayerJoined(player)
    print("[PlayerHandler] " .. player.Name .. " joined")
    
    -- Setup player data
    local playerData = Instance.new("Folder")
    playerData.Name = "Data"
    playerData.Parent = player
end

function PlayerHandler:GetPlayerData(player)
    return player:FindFirstChild("Data")
end

PlayerHandler:Init()
