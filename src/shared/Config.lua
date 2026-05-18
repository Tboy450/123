-- Configuration Module
-- Shared configuration for the entire game

local Config = {
    -- Game Version
    GAME_VERSION = "1.0.0",
    
    -- Server Configuration
    SERVER = {
        MAX_PLAYERS = 50,
        SPAWN_DELAY = 2,
        TICK_RATE = 1/30
    },
    
    -- Player Configuration
    PLAYER = {
        STARTING_HEALTH = 100,
        MAX_HEALTH = 100,
        WALK_SPEED = 16,
        RESPAWN_DELAY = 3
    },
    
    -- UI Configuration
    UI = {
        PRIMARY_COLOR = Color3.fromRGB(0, 120, 255),
        SECONDARY_COLOR = Color3.fromRGB(255, 200, 0),
        TEXT_COLOR = Color3.fromRGB(255, 255, 255)
    },
    
    -- Game Configuration
    GAME = {
        DEBUG_MODE = false,
        AUTO_RESPAWN = true,
        FALL_DAMAGE = true
    }
}

return Config
