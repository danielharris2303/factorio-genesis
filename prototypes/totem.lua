
local function addTotem(i)
    data:extend({{
      type = "furnace",
      name = "totem-"..tostring(i),
  
      --Icon:
      icon = "__genesis__/graphics/icons/totem.png",
      icon_size = 64,
  
      flags = { "placeable-neutral", "hide-alt-info" },
  
      collision_box = { {-5, -2}, {5, 2} },
      selection_box = { {-4, -2}, {4, 2} },
  
      result_inventory_size = 9,
      source_inventory_size = 1,
      cant_insert_at_source_message_key = 'not-sacrifical',
      crafting_categories = {"sacrifice-"..tostring(i)},
      energy_usage = '1W',
      crafting_speed = 1,
          --energy_source = {type = "void", emissions_per_minute = 0},
    --[[  energy_source = {
        type = "fluid",
     --   fluid_box =
        emissions_per_minute = 0
      },]]
      energy_source = {type = "void", emissions_per_minute = 0},
      animation = 
      {
        layers = {
          {
            filename = "__genesis__/graphics/entity/pool/pool.png",
            width = 800,
            height = 500,
            scale = 0.5
          }, 
          {
            filename = "__genesis__/graphics/entity/pool/table-shadow.png",
            width = 800,
            height = 500,
            scale = 0.5,
            draw_as_shadow=true
          },
          {
            filename = "__genesis__/graphics/entity/pool/pool-glow.png",
            width = 800,
            height = 500,
            scale = 0.5,
            draw_as_glow=true
          },
          {
            filename = "__genesis__/graphics/entity/pool/pool-light.png",
            width = 800,
            height = 500,
            scale = 0.5,
            draw_as_light=true
          }
        }
      }
    }})
  end
  
  local function addSacrificeCategory(i)
    data:extend({{
      type = "recipe-category",
      name = "sacrifice-"..tostring(i),
    }})
  end
  
  local function addSacrificeRecipe(i)
    data:extend({{
      type = "recipe",
      name = "sacrifice-"..tostring(i),
      energy_required = 1,
      category = 'sacrifice-'..tostring(i),
      ingredients = {{ "raw-fish", 1}},
      results = {{name='iron-ore', amount=2*i}, {name='copper-ore', amount=i}},
      icon = "__base__/graphics/icons/fish.png",
      icon_size = 64, icon_mipmaps = 4,
      subgroup = 'sacrifice',
      main_product = '',
      hidden = true
    }})
  end
  
  local function genSacrificePrototypes(n)
    for i=1,n do
      addSacrificeCategory(i)
      addSacrificeRecipe(i)
      addTotem(i)
    end
  end
  
  data:extend({
    {
      type = "item-subgroup",
      name = "sacrifice",
      group = 'magic'
    },
    {
      type = "item-group",
      name = 'magic',
      icon = "__genesis__/graphics/icons/magic-item-group.png",
      icon_size = 64,
    }
  })
  
  genSacrificePrototypes(5)