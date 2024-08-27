-- fuel_inertia.lua

function updateFuelInertia(g_force, maneuver_type)
    local inertia_effect = 0.01 * g_force

    if maneuver_type == "left_turn" then
        tanks.left.current_fuel = tanks.left.current_fuel - inertia_effect
        tanks.right.current_fuel = tanks.right.current_fuel + inertia_effect
    elseif maneuver_type == "right_turn" then
        tanks.left.current_fuel = tanks.left.current_fuel + inertia_effect
        tanks.right.current_fuel = tanks.right.current_fuel - inertia_effect
    end

    if tanks.left.current_fuel < 0 then tanks.left.current_fuel = 0 end
    if tanks.right.current_fuel < 0 then tanks.right.current_fuel = 0 end
end
