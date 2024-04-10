data:extend({{
    type = "tile",
    name = "clay-brick-path",

    needs_correction = false,
    minable = {mining_time = 0.1, result = "clay-brick"},
    mined_sound = sounds.deconstruct_bricks(0.8),
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1.3,
    layer = 60,
    decorative_removal_probability = 0.15,
    variants =
    {
        main =
        {
        {
            picture = "__genesis__/graphics/tiles/clay-brick-path/hr-clay-brick-path-1.png",
            count = 16,
            size = 1,
            scale = 0.5
            
        },
        {
            picture = "__genesis__/graphics/tiles/clay-brick-path/hr-clay-brick-path-2.png",
            count = 16,
            size = 2,
            probability = 0.39,
            scale = 0.5
            
        },
        {
            picture = "__genesis__/graphics/tiles/clay-brick-path/hr-clay-brick-path-4.png",
            count = 16,
            size = 4,
            probability = 1,
            scale = 0.5
            
        }
        },
        inner_corner =
        {
            picture = "__genesis__/graphics/tiles/clay-brick-path/hr-clay-brick-path-inner-corner.png",
            count = 16,
            tall = true,
            scale = 0.5
        },
        outer_corner =
        {
            picture = "__genesis__/graphics/tiles/clay-brick-path/hr-clay-brick-path-outer-corner.png",
            count = 8,
            tall = true,
            scale = 0.5
        },
        side =
        {
            picture = "__genesis__/graphics/tiles/clay-brick-path/hr-clay-brick-path-side.png",
            count = 16,
            tall = true,
            scale = 0.5
        
        },
        u_transition =
        {
            picture = "__genesis__/graphics/tiles/clay-brick-path/hr-clay-brick-path-u.png",
            count = 8,
            tall = true,
            scale = 0.5
        },
        o_transition =
        {
            picture = "__genesis__/graphics/tiles/clay-brick-path/hr-clay-brick-path-o.png",
            count = 4,
            scale = 0.5
        }
    },
    transitions = stone_path_transitions,
    transitions_between_transitions = stone_path_transitions_between_transitions,

    walking_sound = concrete_sounds,
    build_sound = concrete_tile_build_sounds,
    map_color={r=86, g=82, b=74},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},
    pollution_absorption_per_second = 0,
    vehicle_friction_modifier = stone_path_vehicle_speed_modifier,
}})