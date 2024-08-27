-- feedback.lua
function updatePanel()
    -- Actualiza indicadores
    local battery_status = string.format("Voltage: %.2f V\nCapacity: %.1f%%", battery_voltage, battery_capacity)
    local apu_status = apu_status
    local generators_status = "Generator 1: " .. (generators_on[1] and "ON" or "OFF") .. "\nGenerator 2: " .. (generators_on[2] and "ON" or "OFF")
    local buses_status = "Main Bus: " .. (buses.main and "ON" or "OFF") .. "\nAux Bus: " .. (buses.aux and "ON" or "OFF")
    
    -- Actualiza los indicadores en el panel
    set_indicator_text("battery_indicator", battery_status)
    set_indicator_text("apu_indicator", "APU Status: " .. apu_status)
    set_indicator_text("generators_indicator", generators_status)
    set_indicator_text("buses_indicator", buses_status)
end
