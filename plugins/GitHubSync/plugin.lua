-- GitHub Sync Plugin for Roblox Studio
-- Syncs scripts from GitHub to Roblox Studio automatically

local plugin = plugin
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

-- Configuration
local CONFIG_FILE = "github-sync.config.json"
local GITHUB_REPO = "Tboy450/123"
local GITHUB_BRANCH = "main"
local SYNC_INTERVAL = 300 -- 5 minutes in seconds

-- Plugin toolbar
local toolbar = plugin:CreateToolbar("GitHub Sync")
local syncButton = toolbar:CreateButton(
    "Sync from GitHub",
    "Pull latest scripts from GitHub repository",
    ""
)

-- UI for status messages
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "GitHubSyncStatus"
statusLabel.Size = UDim2.new(0, 300, 0, 50)
statusLabel.Position = UDim2.new(0, 10, 0, 10)
statusLabel.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.Text = "GitHub Sync Ready"
statusLabel.TextSize = 12
statusLabel.Parent = plugin:CreateDockWidgetPluginGui(
    "GitHubSyncWidget",
    DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, true, 300, 100)
)

-- Utility functions
local function log(message)
    print("[GitHub Sync] " .. message)
    statusLabel.Text = message
end

local function warn_log(message)
    warn("[GitHub Sync] " .. message)
    statusLabel.Text = message
end

-- Load configuration
local function loadConfig()
    local config = {
        token = "",
        repo = GITHUB_REPO,
        branch = GITHUB_BRANCH,
        autoSync = false,
        syncInterval = SYNC_INTERVAL,
        foldersToSync = {"src"}
    }
    return config
end

-- Fetch file content from GitHub
local function fetchFromGitHub(path)
    local url = string.format(
        "https://raw.githubusercontent.com/%s/%s/%s",
        GITHUB_REPO,
        GITHUB_BRANCH,
        path
    )
    
    local success, response = pcall(function()
        return HttpService:GetAsync(url, true)
    end)
    
    if not success then
        warn_log("Failed to fetch: " .. path)
        return nil
    end
    
    return response
end

-- Parse JSON files from GitHub
local function fetchJSON(path)
    local content = fetchFromGitHub(path)
    if not content then return nil end
    
    local success, data = pcall(function()
        return HttpService:JSONDecode(content)
    end)
    
    if not success then
        warn_log("Failed to parse JSON: " .. path)
        return nil
    end
    
    return data
end

-- Create script in game from GitHub content
local function createScript(parent, scriptName, content, scriptType)
    scriptType = scriptType or "LocalScript"
    
    local script = Instance.new(scriptType)
    script.Name = scriptName
    script.Source = content
    script.Parent = parent
    
    log("Created " .. scriptType .. ": " .. scriptName)
end

-- Sync scripts from GitHub
local function syncFromGitHub()
    log("Starting GitHub sync...")
    
    local config = loadConfig()
    
    -- Sync src/server scripts
    local serverScripts = {
        {path = "src/server/main.server.lua", name = "Main"},
        {path = "src/server/playerHandler.server.lua", name = "PlayerHandler"}
    }
    
    local serverScriptParent = game:FindFirstChild("ServerScriptService") or game:GetService("ServerScriptService")
    
    for _, scriptInfo in ipairs(serverScripts) do
        local content = fetchFromGitHub(scriptInfo.path)
        if content then
            createScript(serverScriptParent, scriptInfo.name, content, "Script")
        end
    end
    
    -- Sync src/client scripts
    local clientScripts = {
        {path = "src/client/main.client.lua", name = "Main"}
    }
    
    local clientScriptParent = game:FindFirstChild("StarterPlayer") or game:GetService("StarterPlayer")
    
    for _, scriptInfo in ipairs(clientScripts) do
        local content = fetchFromGitHub(scriptInfo.path)
        if content then
            createScript(clientScriptParent, scriptInfo.name, content, "LocalScript")
        end
    end
    
    log("Sync complete!")
end

-- Auto-sync timer
local lastSync = 0
local function autoSync()
    local currentTime = tick()
    if currentTime - lastSync >= SYNC_INTERVAL then
        lastSync = currentTime
        syncFromGitHub()
    end
end

-- Button click handler
syncButton.Click:Connect(function()
    syncFromGitHub()
    lastSync = tick()
end)

-- Enable auto-sync if configured
local config = loadConfig()
if config.autoSync then
    RunService.Heartbeat:Connect(autoSync)
    log("Auto-sync enabled")
else
    log("Click 'Sync from GitHub' button to sync scripts")
end

log("GitHub Sync plugin loaded!")
