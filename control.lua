ChunkAlteration = require 'control/chunkAlteration'
script.on_init(function ()
    global.doneIntro = false
    remote.call("freeplay", "set_disable_crashsite", true)
    remote.call("freeplay", "set_respawn_items", {})
    remote.call("freeplay", "set_created_items", {})
    remote.call("freeplay", "set_skip_intro", true)
    global.POILocations = {
        {x=1280,y=0}
    }
    ChunkAlteration.genAllOcean = true
end)

script.on_event(defines.events.on_cutscene_waypoint_reached , function (event)
    if global.doneIntro then return end
  
    local player = game.get_player(event.player_index)
    player.exit_cutscene()
    global.doneIntro = true

    player.print("On the fifth day, the Spirit brought the Engineer upon the land.")

    ChunkAlteration.genAllOcean = false
    for x=-1,1 do for y=-1, 1 do
        ChunkAlteration.pushAlteration({x=x,y=y}, ChunkAlteration.alterations.spawnRock)
        game.surfaces.nauvis.delete_chunk({x,y})
    end end

    ChunkAlteration.pushAlteration({x=0,y=0}, ChunkAlteration.alterations.embodyPlayer)
    player.teleport({16,16})
end)

script.on_event(defines.events.on_player_created, function (event)
    if not global.doneIntro then
        global.introCutsceneActive = true
        player = game.get_player(event.player_index)
        player.disassociate_character(player.character)
        player.character.destroy()
        player.set_controller {type = defines.controllers.cutscene, waypoints = {{position={0,0}, transition_time=120--[[600]], time_to_wait = 0--[[60]], zoom=2}}}
        player.print("In the beginning, Nauvis was without form and void, and darkness was upon the face of the deep.")
    end
end)


script.on_event(defines.events.on_chunk_generated, ChunkAlteration.on_chunk_generated)
