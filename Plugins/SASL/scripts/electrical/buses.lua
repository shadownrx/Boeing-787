-- buses.lua

local buses = { main = true, aux = true}

function updateBusStatus()
    if not buses.main then
        buses.aux = true
        showAlert("Main bus Failure")
    end
end

function toggleBus(name)
    buses[name] = not buses[name]
end