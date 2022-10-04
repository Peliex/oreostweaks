--Hook for detaching small charger from walls
Hook.Patch("oreostweaks.smallchargerdeattach", "Barotrauma.Items.Components.Holdable", "DeattachFromWall", function(instance)

    -- Variable declarations
    local item = instance.item
    local itemID = instance.item.Prefab.identifier

    -- (TODO)Oreo: Iterate through charger inventory and drop all items onto the ground on deconstruct

    -- Check if item is our smallcharger
    if(itemID == "oreostweaks.smallcharger") then

        -- Verify that smallcharger has been, in fact, removed from a wall
        if(instance.attached == false) then

            -- Iterate through all components until ItemContainer is found
            for component in item.components do
                if(component.name == "ItemContainer") then

                    -- Do not draw the inventory, because the item is not attached to a wall.
                    component.DrawInventory = false
                end
            end
        end
    end
end, Hook.HookMethodType.After)

-- Hook for attaching small charger to walls
Hook.Patch("oreostweaks.smallchargerattach", "Barotrauma.Items.Components.Holdable", "AttachToWall", function(instance)

    -- Variable declarations
    local item = instance.item
    local itemID = instance.item.Prefab.identifier

    -- Check if item is our smallcharger
    if(itemID == "oreostweaks.smallcharger") then

        -- Verify that the smallcharger is in fact attached to a wall
        if(instance.attached == true) then

            -- Iterate through all components until ItemContainer is found
            for component in item.components do
                if(component.name == "ItemContainer") then

                    -- Draw the inventory so people can see it's contents when interacting with it as normal
                    component.DrawInventory = true
                end
            end
        end
    end
end, Hook.HookMethodType.After) -- Inject our code at the end of the function
