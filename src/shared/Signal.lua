-- Signal Module
-- A simple signal/event system for Roblox

local Signal = {}
Signal.__index = Signal

-- Create new signal
function Signal.new()
    return setmetatable({
        _callbacks = {}
    }, Signal)
end

-- Connect callback to signal
function Signal:Connect(callback)
    local connection = {
        _callback = callback,
        _signal = self,
        Disconnect = function(self)
            for i, cb in ipairs(self._signal._callbacks) do
                if cb == self._callback then
                    table.remove(self._signal._callbacks, i)
                    break
                end
            end
        end
    }
    
    table.insert(self._callbacks, callback)
    return connection
end

-- Fire signal with arguments
function Signal:Fire(...)
    for _, callback in ipairs(self._callbacks) do
        pcall(callback, ...)
    end
end

-- Wait for signal to fire
function Signal:Wait()
    local bindable = Instance.new("BindableEvent")
    local connection = self:Connect(function(...)
        bindable:Fire(...)
    end)
    local result = bindable.Event:Wait()
    bindable:Destroy()
    return result
end

return Signal
