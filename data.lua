--[[

PIPES
====
1A) Ditches - can only be dug in sand
1B) Bamboo piping - 1x3, very thin, no corners (bamboo only grows straight)
1C) Ceramic corner - 1x1, joins onto bamboo piping -- straight ceramic pipes are too long to be fired without further research

2) Ceramic piping

4) Iron piping - 1x1, normal, can arbitrarily split fluids - but no undergrounds

ROTORS
=====
Modified 'reactors' create rotatry (heat) power - possibly a waterwheel using the levels mechanic???
- or a bunch of wind mills connected together with gears

CERAMICS
=====
mine raw clay from earth (using a furnace with no required input)
mix with water to make clay slurry
form the slurry into shapes (bricks, pots) with a mold
use a tool to 'flatten ground' to create a drying space (spawns a 1x1 building on the tile you're standing on: this building is a furnace accepting clay shapes, where the 'working' animation shows a clay blob slowly drying out on the ground - the sprite is mostly transparent)

    Shapes
        - brick (can make brick parth - better than stone path, and unlocked earlier, but just uses far too many bricks for earlygame viability - also makes a better wall)
        - ceramic pot (like a barrel)
        - ceramic roofing tile - for buildings' roofs
        - ceramic pipe - can be placed anywhere (not just on sand)
            - but low throughput, and awkward to place (2-tile-long sections, and no undergrounds)
            - you have to reasearch advanced ceramics to unlock corner pieces

RAIN: a random local event (like a CME)
=====
- ruins all your unfiredclays (either wet ones in storage, or ones currently drying in a 'drying space' building)
    and some mechanic means you tend to get big influxes of lots of clay things to dry at the same time - so they have to queue

- waters your crops

- fills up your ditches
    so if you need water in a particular place (bearing in mind you spawn in a desert), you need to dig a ditch and wait for it to fill
    ditches are retextured pipes: direct them into a slurry-pit to wet your clay
]]

sounds = require("__base__/prototypes/entity/sounds")


require "prototypes/drying"
require "prototypes/totem"
require "prototypes/clay-brick-path"
require "prototypes/ditch"
require "prototypes/blood"

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