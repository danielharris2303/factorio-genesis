local dryingDuration = 1 --10
local num_frames = 5
local dryingAnimationSpeed = num_frames * ((1/32)/dryingDuration)

data:extend({
    {
      type = "assembling-machine",
      name = "drying-space",
    
      --Icon:
      icon = "__core__/graphics/cancel.png",
      icon_size = 64,
    
      flags = { "placeable-neutral"},
    
      crafting_categories = {'drying'},
    
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
      collision_mask = { "item-layer", "object-layer", "water-tile"},
      remove_decoratives = 'false',

      build_sound = sounds.small_bush,
      mined_sound = sounds.small_bush,
    
      result_inventory_size = 1,
      source_inventory_size = 1,

      minable = {mining_time = 0.1},
      
      animation = {

        layers = {
          {
            filename = "__genesis__/graphics/entity/drying-space/drying-space.png",
            priority = "extra-high",
            width = 64,
            height = 80,
            repeat_count = 5,
            frame_count = 1,
            shift = util.by_pixel(-0.5, -0.5),
            scale = 0.5,
            animation_speed = dryingAnimationSpeed,
          },
          {
            filename = "__genesis__/graphics/entity/drying-space/drying-blob-animation.png",
            priority = "extra-high",
            width = 36,
            height = 36,
            frame_count = 5,
            shift = util.by_pixel(-0.5, -0.5),
            scale = 0.3,
            animation_speed = dryingAnimationSpeed,
          }
        }
      },

      idle_animation = {
        filename = "__genesis__/graphics/entity/drying-space/drying-space.png",
        priority = "extra-high",
        width = 64,
        height = 80,
        repeat_count = 5,
        frame_count = 1,
        shift = util.by_pixel(-0.5, -0.5),
        scale = 0.5,
        animation_speed = dryingAnimationSpeed,
      },

    working_visualisations = {
      { --Show output visually
        animation = {
          filename = "__genesis__/graphics/entity/drying-space/drying-blob.png",
          priority = "extra-high",
          width = 36,
          height = 36,
          repeat_count = 5,
          frame_count = 1,
          shift = util.by_pixel(-0.5, -0.5),
          scale = 0.3,
          animation_speed = dryingAnimationSpeed,
        },
        always_draw = true, --Draw even when the furnace is idle
        apply_tint = "status"
      },
    },

    status_colors = {
      idle = {0,0,0,0},
      working = {0,0,0,0},
      insufficient_input = {0,0,0,0},
      full_output = {1,1,1,1}
    },

      energy_usage = '1W',
      crafting_speed = 1,
      energy_source = {type = "void", emissions_per_minute = 0},
  },


  {
    type = "recipe",
    name = 'dry-clay-brick',
    energy_required = dryingDuration,
    category = 'drying',
    ingredients = {{ "wet-unfired-clay-brick", 1}},
    result = 'unfired-clay-brick',
    icon = "__genesis__/graphics/icons/brick-shape/unfired-clay-brick.png",
    icon_size = 64, icon_mipmaps = 4,
  }, 

})


data:extend({
  {
    type = "item",
    name = "clay-brick",
    icon = "__genesis__/graphics/icons/brick-shape/clay-brick.png",
    icon_size = 64,
    place_as_tile =
      {
        result = "clay-brick-path",
        condition_size = 1,
        condition = { "water-tile" }
      },
    stack_size = 2
  },
  {
    type = "item",
    name = "unfired-clay-brick",
    icon = "__genesis__/graphics/icons/brick-shape/unfired-clay-brick.png",
    icon_size = 64,
    stack_size = 1
  },
  {
    type = "item",
    name = "wet-unfired-clay-brick",
    icon = "__genesis__/graphics/icons/brick-shape/wet-unfired-clay-brick.png",
    icon_size = 64,
    place_result = "drying-space",
    stack_size = 1
  },
  {
    type = "item",
    name = "clay-slurry",
    icon = "__genesis__/graphics/icons/clay-slurry.png",
    icon_size = 64,
    stack_size = 1
  },
  {
    type = "item",
    name = "clay",
    icon = "__genesis__/graphics/icons/clay.png",
    icon_size = 64,
    stack_size = 1
  },
})

data:extend({

  {
    type = "recipe",
    name = 'fire-clay-brick',
    energy_required = 1,
    category = 'smelting',
    ingredients = {{'unfired-clay-brick', 1}},
    result = 'clay-brick',
    icon = "__genesis__/graphics/icons/brick-shape/clay-brick.png",
    icon_size = 64, icon_mipmaps = 4
  }, 

  {
    type = "recipe",
    name = 'form-wet-clay-brick-from-slurry',
    energy_required = 1,
    category = 'crafting',
    ingredients = {{ "clay-slurry", 1}},
    result = 'wet-unfired-clay-brick',
    icon = "__genesis__/graphics/icons/brick-shape/wet-unfired-clay-brick.png",
    icon_size = 64, icon_mipmaps = 4
  }, 

  {
    type = "recipe",
    name = 'wet-clay',
    energy_required = 1,
    category = 'chemistry',
    ingredients = {{ "clay", 1}, {type='fluid',name='water', amount = 25}},
    result = 'clay-slurry',
    icon = "__genesis__/graphics/icons/clay-slurry.png",
    icon_size = 64, icon_mipmaps = 4
  }, 

})

data:extend({{
  type = "recipe-category",
  name = 'drying',
}})

data:extend({{
  type = "recipe-category",
  name = 'dummy',
}})