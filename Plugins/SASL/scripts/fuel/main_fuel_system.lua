-- main_fuel_system.lua

function mainFuelSystemUpdate(altitude, temperature, g_force, maneuver_type)
    updateFuelSystemWithWeather(altitude, temperature)
    updatePumpStatusWithElectricity()
    detectAdvancedFuelEmergencies()
    updateFuelInertia(g_force, maneuver_type)
    checkFuelQuality()
    
    adjustEnginePerformanceDueToFuelQuality("left")
    adjustEnginePerformanceDueToFuelQuality("right")
end
