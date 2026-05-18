-- Main Server Script
-- This script runs on the server and initializes game systems

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Configuration
local CONFIG = {
    GAME_VERSION = "1.0.0",
    MAX_PLAYERS = 50,
    SPAWN_DELAY = 2
}

-- Functions
local function onPlayerAdded(player)
    print(player.Name .. " joined the game!")
    
    -- Wait for character
    local character = player.Character or player.CharacterAdded:Wait()
    print(player.Name .. "'s character loaded")
end

local function onPlayerRemoving(player)
    print(player.Name .. " left the game")
end

-- Connections
Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)

print("Server initialized - Game v" .. CONFIG.GAME_VERSION)
