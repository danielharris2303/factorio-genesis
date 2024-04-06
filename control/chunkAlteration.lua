
local ChunkAlteration = {genAllOcean = false}
ChunkAlteration.alterations = {}

local sheduledAlterations = {}

function ChunkAlteration.alterations.spawnRock(event)
    b1 = game.surfaces.nauvis.create_entity({name='rock-big', position={event.position.x*32 + 16,event.position.y*32 + 16}})
    b1.force = 'neutral'
end

function ChunkAlteration.alterations.spawnBiter(event)
    b1 = game.surfaces.nauvis.create_entity({name='small-biter', position={event.position.x*32 + 16,event.position.y*32 + 16}})
    b1.force = 'neutral'
end

function ChunkAlteration.alterations.sandfillWater(event)
    tiles = {}
    for x=event.area.left_top.x,event.area.right_bottom.x do 
        for y=event.area.left_top.y,event.area.right_bottom.y do
            if game.surfaces.nauvis.get_tile(x,y).collides_with('player-layer') then
                tiles[#tiles+1] = {position={x,y},name="sand-1"}
            end
        end
    end 
    game.surfaces.nauvis.set_tiles(tiles)
end

function ChunkAlteration.alterations.fillOcean(event)
    tiles = {}
    for x=event.area.left_top.x,event.area.right_bottom.x do 
        for y=event.area.left_top.y,event.area.right_bottom.y do
            tiles[#tiles+1] = {position={x,y},name="deepwater"}
        end
    end 
    game.surfaces.nauvis.set_tiles(tiles)
end

function ChunkAlteration.alterations.embodyPlayer()
    character = game.surfaces.nauvis.create_entity({name='character', position={16,16}})
    player.set_controller {type = defines.controllers.character, character = character}
    player.character_running_speed_modifier = 0 -- -1
    b1 = game.surfaces.nauvis.create_entity({name='small-biter', position={18,18}})
    b1.force = 'neutral'
end

local function popAlterations(position)
    local col = sheduledAlterations[position.x]
    if col~=nil then
        local chunk = col[position.y]
        if chunk~=nil then
            col[position.y]=nil
            if #col==0 then
                sheduledAlterations[position.x]=nil
            end
            global.sheduledAlterations = sheduledAlterations
            return chunk
        end
    end
    return nil
end

function ChunkAlteration.pushAlteration(position, alteration)
    local col = sheduledAlterations[position.x]
    if col==nil then
        sheduledAlterations[position.x] = {}
        col = sheduledAlterations[position.x] 
    end
    local chunk = col[position.y]
    if chunk==nil then
        col[position.y] = {alteration}
    else
        chunk[#chunk+1] = alteration
    end
    global.sheduledAlterations = sheduledAlterations
end


function ChunkAlteration.on_chunk_generated(event)
    if event.surface.name == 'nauvis' then
        if ChunkAlteration.genAllOcean then ChunkAlteration.alterations.fillOcean(event) end
        alterations = popAlterations(event.position)
        if alterations then
            for _,alteration in ipairs(alterations) do
                alteration(event)
            end
        end
    end
    Debug.log(sheduledAlterations)
end

return ChunkAlteration