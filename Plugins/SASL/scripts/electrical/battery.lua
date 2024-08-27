local battery_voltage = 24
local battery_capacity = 100
local battery_drain_rate = 0.05

local battery_on = true

function updateBatteryStatus()
    if battery_on then
        -- Simulates battery discharge
        battery_capacity = battery_capacity - (battery_drain_rate * battery_current_load)
        battery_voltage = battery_capacity > 0 and (24 * battery_capacity / 100) or 0

        -- Generates alerts for low capacity or problems
        if battery_capacity < 10 then
            -- Show low battery warning
            showAlert("Battery low")
        end
    end
end


function toggleBattery()
    battery_on = not battery_on
    if not battery_on then
        battery_capacity = 100
    end
end

