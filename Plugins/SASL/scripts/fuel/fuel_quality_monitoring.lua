-- fuel_quality_monitoring.lua

local fuel_contaminated = false

function checkFuelQuality()
    if math.random() < 0.01 then
        fuel_contaminated = true
        showECAMMessage("FUEL CONTAMINATION DETECTED")
    end
end

function adjustEnginePerformanceDueToFuelQuality(engine)
    if fuel_contaminated then
        local performance_drop = math.random(10, 30) / 100
        adjustEngineThrust(engine, performance_drop)
        showECAMMessage(engine .. " THRUST REDUCED DUE TO CONTAMINATED FUEL")
    end
end
