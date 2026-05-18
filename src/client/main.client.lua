-- Main Client Script
-- Runs on the client side for UI and local game logic

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Configuration
local CONFIG = {
    DEBUG = true
}

-- Functions
local function init()
    if CONFIG.DEBUG then
        print("[Client] Initialized for " .. player.Name)
    end
end

local function onInput(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.E then
        print("[Client] E key pressed")
    end
end

-- Connections
UserInputService.InputBegan:Connect(onInput)

-- Initialize
init()
