

local ditchpictures = function()
  return
  {
    straight_vertical_single =
    {
        filename = "__genesis__/graphics/entity/ditch/hr-pipe-straight-vertical-single.png",
        priority = "extra-high",
        width = 160,
        height = 160,
        scale = 0.5
    },
    straight_vertical =
    {
      filename = "__genesis__/graphics/entity/ditch/ditch-straight-vertical.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    straight_vertical_window = {
      filename = "__genesis__/graphics/entity/ditch/ditch-straight-vertical.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    straight_horizontal_window = {
      filename = "__genesis__/graphics/entity/ditch/ditch-straight-horizontal.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    straight_horizontal =
    {
      filename = "__genesis__/graphics/entity/ditch/ditch-straight-horizontal.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    corner_up_right =
    {
      filename = "__genesis__/graphics/entity/ditch/empty.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    corner_up_left =
    {
      filename = "__genesis__/graphics/entity/ditch/ditch-corner-up-left.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    corner_down_right =
    {
      filename = "__genesis__/graphics/entity/ditch/empty.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    corner_down_left =
    {
      filename = "__genesis__/graphics/entity/ditch/empty.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    t_up =
    {

      filename = "__genesis__/graphics/entity/ditch/empty.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    t_down =
    {
      filename = "__genesis__/graphics/entity/ditch/empty.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    t_right =
    {
      filename = "__genesis__/graphics/entity/ditch/empty.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    t_left =
    {
      filename = "__genesis__/graphics/entity/ditch/empty.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    cross =
    {
      filename = "__genesis__/graphics/entity/ditch/empty.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    ending_up =
    {
      filename = "__genesis__/graphics/entity/ditch/ditch-straight-vertical.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    ending_down =
    {
      filename = "__genesis__/graphics/entity/ditch/ditch-straight-vertical.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      
    },
    ending_right =
    {
      filename = "__genesis__/graphics/entity/ditch/ditch-end-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
    },
    ending_left =
    {
      filename = "__genesis__/graphics/entity/ditch/ditch-end-left.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
    },
    horizontal_window_background =
    {
      filename = "__genesis__/graphics/entity/ditch/empty.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
    },
    vertical_window_background =
    {
      filename = "__genesis__/graphics/entity/ditch/empty.png",
      priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
    },
    fluid_background =
    {
        filename = "__genesis__/graphics/entity/ditch/hr-fluid-background.png",
        priority = "extra-high",
        width = 64,
        height = 40,
        scale = 0.5
    },
    low_temperature_flow =
    {
      filename = "__genesis__/graphics/entity/ditch/fluid-flow-low-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    middle_temperature_flow =
    {
      filename = "__genesis__/graphics/entity/ditch/fluid-flow-medium-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    high_temperature_flow =
    {
      filename = "__genesis__/graphics/entity/ditch/fluid-flow-high-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    gas_flow =
    {
        filename = "__genesis__/graphics/entity/ditch/hr-steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 48,
        height = 30,
        frame_count = 60,
        axially_symmetrical = false,
        direction_count = 1
      
    }
  }
end

data:extend({
  {
      type = "pipe",
      name = "ditch",
      icon = "__genesis__/graphics/icons/pipe.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1},
      max_health = 100,
      corpse = "pipe-remnants",
      dying_explosion = "pipe-explosion",
      resistances =
      {
        {
          type = "fire",
          percent = 80
        },
        {
          type = "impact",
          percent = 30
        }
      },
      fast_replaceable_group = "pipe",
      collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
      collision_mask = { "item-layer", "object-layer", "water-tile"},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      fluid_box =
      {
        base_area = 1,
        pipe_connections =
        {
          { position = {0, -1} },
          { position = {1, 0} },
          { position = {0, 1} },
          { position = {-1, 0} }
        }
      },
      vehicle_impact_sound = sounds.generic_impact,
      pictures = ditchpictures(),
      working_sound =
      {
        sound = sounds.pipe,
        match_volume_to_activity = true,
        audible_distance_modifier = 0.3,
        fade_in_ticks = 4,
        fade_out_ticks = 60
      },
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
  
      horizontal_window_bounding_box = {{-1, -0.15625}, {1, 0.15625}}, --{{-1, -0.28125}, {1, 0.15625}}
      vertical_window_bounding_box = {{-0.28125, -1}, {0.03125, 1}}
    },

    {
      type = "item",
      name = "dig-ditch",
      icon = "__base__/graphics/icons/pipe.png",
      icon_size = 64, icon_mipmaps = 4,
      subgroup = "energy-pipe-distribution",
      order = "a[pipe]-a[pipe]",
      place_result = "ditch",
      
      stack_size = 100
    },

})


