-- advanced_fuel_transfer.lua

local transfer_in_progress = false

function initiateFuelTransfer(source_tank, destination_tank, amount)
    if not transfer_in_progress then
        transfer_in_progress = true
        local available_fuel = math.min(tanks[source_tank].current_fuel, amount)
        tanks[source_tank].current_fuel = tanks[source_tank].current_fuel - available_fuel
        tanks[destination_tank].current_fuel = tanks[destination_tank].current_fuel + available_fuel
        showECAMMessage(string.format("Transferring %.0f units from %s to %s", available_fuel, source_tank, destination_tank))
        transfer_in_progress = false
    else
        showECAMMessage("Transfer already in progress")
    end
end

function balanceFuel()
    -- Mantener el equilibrio de combustible
    if math.abs(tanks.left.current_fuel - tanks.right.current_fuel) > 500 then
        if tanks.left.current_fuel > tanks.right.current_fuel then
            initiateFuelTransfer("left", "right", 250)
        else
            initiateFuelTransfer("right", "left", 250)
        end
    end
end
