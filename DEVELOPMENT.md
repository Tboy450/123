# Development Guidelines

## Code Standards

### Lua Style Guide
- Use camelCase for variables and functions
- Use PascalCase for classes/modules
- Use UPPER_CASE for constants
- Maximum line length: 120 characters
- Indent with 4 spaces

### Example Code Structure

**Server Script:**
```lua
-- Service declarations
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Configuration
local CONFIG = {
    TIMEOUT = 30,
    MAX_PLAYERS = 100
}

-- Functions
local function handlePlayerJoin(player)
    print(player.Name .. " joined the game")
end

-- Connections
Players.PlayerAdded:Connect(handlePlayerJoin)
```

**Client Script:**
```lua
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Initialize
local function init()
    print("Client initialized")
end

-- Main
init()
```

## Naming Conventions

| Type | Convention | Example |
|------|-----------|---------|
| Variables | camelCase | `playerCount`, `isAlive` |
| Functions | camelCase | `getPlayer()`, `handleDamage()` |
| Classes | PascalCase | `Player`, `Weapon` |
| Constants | UPPER_CASE | `MAX_HEALTH`, `SPAWN_TIME` |
| Events | PascalCase + "Event" | `PlayerSpawnedEvent` |

## Comments

```lua
-- Single line comment for brief explanations

--[[
    Multi-line comment for detailed explanations
    Useful for function documentation
]]

-- TODO: Future improvements
-- FIXME: Known issue to address
-- NOTE: Important detail to remember
```

## Error Handling

```lua
local function safeCall(func, ...)
    local success, result = pcall(func, ...)
    if not success then
        warn("Error in function: " .. tostring(result))
        return nil
    end
    return result
end
```

## Module Pattern

```lua
local MyModule = {}

function MyModule:Initialize()
    -- Setup code
end

function MyModule:GetValue()
    return self.value
end

return MyModule
```

## Testing

1. **Manual Testing**: Test in Roblox Studio
2. **Server Testing**: Use Run button in Studio
3. **Client Testing**: Use Play button and check Output
4. **Communication**: Test with both server and client running

## Common Patterns

### Signal/Event System
```lua
local Signal = {}
Signal.__index = Signal

function Signal.new()
    return setmetatable({
        _bindables = {},
    }, Signal)
end

function Signal:Connect(callback)
    table.insert(self._bindables, callback)
end

function Signal:Fire(...)
    for _, callback in ipairs(self._bindables) do
        callback(...)
    end
end

return Signal
```

### Configuration Module
```lua
local Config = {
    GAME_VERSION = "1.0.0",
    MAX_PLAYERS = 50,
    SPAWN_DELAY = 2,
    COLORS = {
        PRIMARY = Color3.fromRGB(0, 120, 255),
        SECONDARY = Color3.fromRGB(255, 200, 0)
    }
}

return Config
```

## Performance Tips

1. **Cache Services**: Store service references instead of calling repeatedly
2. **Use Debouncing**: Prevent function spam with debounce timers
3. **Optimize Loops**: Avoid heavy calculations in loops
4. **Use Heartbeat**: For frame-accurate updates use `RunService.Heartbeat`
5. **Memory Management**: Disconnect signals and clean up when done

## GitHub Workflow

1. Create a feature branch: `git checkout -b feature/my-feature`
2. Make your changes and commit regularly
3. Push to GitHub: `git push origin feature/my-feature`
4. Create a Pull Request for review
5. Merge after approval

## Useful Services

```lua
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Debris = game:GetService("Debris")
```

## Debugging

### Print/Warn/Error
```lua
print("Info message")
warn("Warning message")
error("Error message")
```

### Script Analysis
- Check **Output** window for errors
- Use `Instance:Destroy()` to clean up
- Check **Performance** stats in View menu

## Resources

- [Roblox API Reference](https://developer.roblox.com/en-us/api-reference)
- [Lua 5.1 Documentation](https://www.lua.org/manual/5.1/)
- [Roblox Creator Documentation](https://create.roblox.com/)
