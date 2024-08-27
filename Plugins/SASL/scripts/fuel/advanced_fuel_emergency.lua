-- advanced_fuel_emergency.lua

function detectAdvancedFuelEmergencies()
    if tanks.left.current_fuel < tanks.right.current_fuel - 500 then
        emergency_scenarios.fuel_leak = true
        showECAMMessage("FUEL LEAK DETECTED")
    end
    
    if tanks.left.current_fuel == 0 and pumps.left_pump.status then
        emergency_scenarios.pump_failure = true
        showECAMMessage("LEFT FUEL PUMP DRY RUNNING")
    end
    
    if math.abs(tanks.left.current_fuel - tanks.right.current_fuel) > 1000 then
        emergency_scenarios.tank_imbalance = true
        showECAMMessage("FUEL TANK IMBALANCE")
    end
end
