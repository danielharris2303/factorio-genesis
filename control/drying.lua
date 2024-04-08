local onDryingSpacePreviewPlaced = function(event)
    local position = event.created_entity.position
    event.created_entity.destroy()
    local entity = game.surfaces.nauvis.create_entity({name='drying-space', position=position})
    entity.get_inventory(defines.inventory.furnace_source).insert({name='unfired-clay-brick'})
end

script.on_event(defines.events.on_built_entity, onDryingSpacePreviewPlaced, {{filter = "name", name='drying-space-preview-clay-brick'}})