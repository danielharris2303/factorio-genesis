--When a wet unfired clay shape is placed as a drying space, the clay shape is placed inside the drying space
local onDryingSpacePreviewPlaced = function(event)
    local position = event.created_entity.position
    event.created_entity.set_recipe('dry-clay-brick')
    event.created_entity.get_inventory(defines.inventory.furnace_source).insert(event.stack)
end

script.on_event(defines.events.on_built_entity, onDryingSpacePreviewPlaced, {{filter = "name", name='drying-space'}})