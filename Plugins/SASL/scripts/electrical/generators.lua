-- generators.lua

local generators_on = {true, true} -- Two Generators

function updateGeneratorsStatus()
    for i, on in ipairs(generators_on) do
        if on then
            -- Simulation chargerd
            if math.random() < 0.01 then
                generators_on[i] = false
                showAlert("Generator " .. i .. " failure")
            end
        end
    end
end

function toggleGenerator(index)