local ItemSearch = {}

local ongoingSearchInfo = nil

script.on_event(defines.events.on_tick , function (event)
    if ongoingSearchInfo~=nil then
        for i=1,200 do
            local chunk = ongoingSearchInfo.chunkSearchIterator()
            if chunk==nil then
                game.print('Done!')
                ongoingSearchInfo = nil
                break
            else
                ItemSearch.DeleteAllItemsWithNameInChunk(chunk)
            end
        end
    end
end)

function ItemSearch.DeleteAllItemsWithNameInChunk(chunk)
    for _,entity in ipairs(game.surfaces.nauvis.find_entities_filtered({area=chunk.area, has_item_inside=ongoingSearchInfo.prototypeToDelete})) do
        while entity.remove_item(ongoingSearchInfo.nameToDelete)>0 do end
    end
    for _,entity in ipairs(game.surfaces.nauvis.find_entities_filtered({area=chunk.area, type='inserter'})) do
        while entity.remove_item(ongoingSearchInfo.nameToDelete)>0 do end
    end
    for _,entity in ipairs(game.surfaces.nauvis.find_entities_filtered({area=chunk.area, type='item-entity'})) do
        if (entity.stack.name==ongoingSearchInfo.nameToDelete) then entity.destroy() end
    end
end

function ItemSearch.DeleteAllItemsWithName(name)
    game.print('Begining world purge of ' .. name)
    ongoingSearchInfo = {
        chunkSearchIterator = game.surfaces.nauvis.get_chunks(),
        nameToDelete = name,
        prototypeToDelete = game.item_prototypes["stone"]
    }
end

return ItemSearch