-- fuel_pumps_electricity.lua

function updatePumpStatusWithElectricity()
    local electricity_available = checkElectricityStatus()

    for pump_name, pump in pairs(pumps) do
        if pump.status then
            if electricity_available then
                local fuel_to_move = pump.flow_rate * fuel_flow_rate_modifier
                moveFuelToEngine(pump_name:match("left") and "left" or pump_name:match("right") and "right" or "center", fuel_to_move)
            else
                showECAMMessage(pump_name .. " OFF due to electrical failure")
                pump.status = false
            end
        end
    end
end
