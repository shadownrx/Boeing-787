-- fuel_climate_effects.lua

function updateFuelDensity(temperature)
    local base_density = 0.8 -- kg/L a temperatura estándar
    local temperature_coefficient = 0.00064 -- Cambio de densidad por grado Celsius

    fuel_density = base_density * (1 - (temperature - 15) * temperature_coefficient)
end

function updateFuelSystemWithWeather(altitude, temperature)
    updateFuelDensity(temperature)
    updateTankStatus(altitude, temperature)
end
