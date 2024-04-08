--[[

IDEA:
mine raw clay from earth (using a furnace with no required input)
mix with water to make clay slurry
form the slurry into shapes (bricks, pots) with a mold
use a tool to 'flatten ground' to create a drying space (spawns a 1x1 building on the tile you're standing on: this building is a furnace accepting clay shapes, where the 'working' animation shows a clay blob slowly drying out on the ground - the sprite is mostly transparent)

possibly rains/floods come and ruins all your not-yet-fully dried clays (either wet ones in storage, or ones currently drying in a 'drying space' building)

or rain is a random chance per-chunk
and NEEDED for agriculture - so there's a tradeoff
and some mechanic means you tend to get big influxes of lots of clay things to dry at the same time - so they have to queue

]]

require "prototypes/drying"
require "prototypes/totem"


--Change existing prototypes
local character = data.raw["character"]["character"]
  character.inventory_size = 3
  local reach = 2
  character.build_distance = reach
  character.drop_item_distance = reach
  character.reach_distance = reach
  local speedMult = 1/3
  character.running_speed = 0.15*speedMult
  character.distance_per_frame = 0.13*speedMult

  data.raw["item"]["stone"].stack_size = 2