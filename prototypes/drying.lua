data:extend({
    {
      type = "furnace",
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
    
      result_inventory_size = 1,
      source_inventory_size = 1,

      
      animation = {
        layers = {
          {
            filename = "__genesis__/graphics/entity/drying-space/drying-space.png",
            priority = "extra-high",
            width = 64,
            height = 80,
            frame_count = 1,
            shift = util.by_pixel(-0.5, -0.5),
            scale = 0.5
          },
          {
            filename = "__genesis__/graphics/entity/drying-space/drying-blob.png",
            priority = "extra-high",
            width = 64,
            height = 80,
            frame_count = 1,
            shift = util.by_pixel(-0.5, -0.5),
            scale = 0.5
          }
        }
      },

      idle_animation = {
        filename = "__genesis__/graphics/entity/drying-space/drying-space.png",
        priority = "extra-high",
        width = 64,
        height = 80,
        frame_count = 1,
        shift = util.by_pixel(-0.5, -0.5),
        scale = 0.5
    },

      energy_usage = '1W',
      crafting_speed = 1,
      energy_source = {type = "void", emissions_per_minute = 0},
  },

  {
    type = "item",
    name = "unfired-clay-brick",
    icon = "__genesis__/graphics/icons/unfired-clay-brick.png",
    icon_size = 64,
    place_result = "drying-space-preview-clay-brick",
    stack_size = 1
  },

  {
    type = "recipe",
    name = 'dry-clay-brick',
    energy_required = 5,
    category = 'drying',
    ingredients = {{ "unfired-clay-brick", 1}},
    result = 'stone-brick',
    icon = "__genesis__/graphics/icons/unfired-clay-brick.png",
    icon_size = 64, icon_mipmaps = 4
  }

})

  data:extend({{
    type = "furnace",
    name = "drying-space-preview-clay-brick",
  
    icon = "__genesis__/graphics/icons/unfired-clay-brick.png",
    icon_size = 64,
  
    flags = { "placeable-neutral"},
  
    crafting_categories = {'dummy'},
  
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    collision_mask = { "item-layer", "object-layer", "water-tile"},
    remove_decoratives = 'false',
  
    result_inventory_size = 1,
    source_inventory_size = 1,

    
    animation = {
      layers = {
        {
          filename = "__genesis__/graphics/entity/drying-space/drying-space.png",
          priority = "extra-high",
          width = 64,
          height = 80,
          frame_count = 1,
          shift = util.by_pixel(-0.5, -0.5),
          scale = 0.5
        }, 

        {
          filename = "__genesis__/graphics/icons/unfired-clay-brick.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          frame_count = 1,
          shift = util.by_pixel(-0.5, -0.5),
          scale = 0.25
        }, 
      }
    },

    energy_usage = '1W',
    crafting_speed = 1,
    energy_source = {type = "void", emissions_per_minute = 0},
  }})
  
data:extend({{
  type = "recipe-category",
  name = 'drying',
}})

data:extend({{
  type = "recipe-category",
  name = 'dummy',
}})