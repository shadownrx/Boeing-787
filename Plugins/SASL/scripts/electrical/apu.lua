-- apu.lua

local apu_status = "OFF"
local apu_temperature = 0
local apu_pressure = 0
local max_temperature = 400
local min_pressure = 50


function udpateAPUStatus()
    if apu_status == "STARTING" then
        -- Simulation Process Start
        apu_temperature = apu_temperature + 5
        apu_pressure = apu_pressure + 1

        if apu_temperature > 100 and apu_pressure > 10 then
            apu_status = "ON"
        end
    elseif apu_status == "ON" then
        -- Provides power to generators
        if apu_temperature > max_temperature or apu_pressure < min_pressure then
            apu_status = "FAIL"
            showAlert("APU failure")
        end
    end
end

function toggleAPU()
    if apu_status == "OFF" then
        apu_status = "STARTING"
    else
        apu_status = "OFF"
    end
end

