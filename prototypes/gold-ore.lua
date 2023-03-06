local resource_autoplace = require('resource-autoplace');
local noise = require('noise');

local util = require("data-util");

data:extend(
{
  {
    type = "optimized-particle",
    name = "gold-ore-particle",
    flags = {"not-on-map"},
    life_time = 180,
    pictures =
    {
      {
        filename = "__bzgold__/graphics/entity/ores/particle/gold-ore-particle-1.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__bzgold__/graphics/entity/ores/particle/hr-gold-ore-particle-1.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__bzgold__/graphics/entity/ores/particle/gold-ore-particle-2.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__bzgold__/graphics/entity/ores/particle/hr-gold-ore-particle-2.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__bzgold__/graphics/entity/ores/particle/gold-ore-particle-3.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__bzgold__/graphics/entity/ores/particle/hr-gold-ore-particle-3.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__bzgold__/graphics/entity/ores/particle/gold-ore-particle-4.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__bzgold__/graphics/entity/ores/particle/hr-gold-ore-particle-4.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      }
    },
    shadows =
    {
      {
        filename = "__bzgold__/graphics/entity/ores/particle/gold-ore-particle-shadow-1.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__bzgold__/graphics/entity/ores/particle/hr-gold-ore-particle-shadow-1.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__bzgold__/graphics/entity/ores/particle/gold-ore-particle-shadow-2.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__bzgold__/graphics/entity/ores/particle/hr-gold-ore-particle-shadow-2.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__bzgold__/graphics/entity/ores/particle/gold-ore-particle-shadow-3.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__bzgold__/graphics/entity/ores/particle/hr-gold-ore-particle-shadow-3.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      },
      {
        filename = "__bzgold__/graphics/entity/ores/particle/gold-ore-particle-shadow-4.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1,
        hr_version =
        {
          filename = "__bzgold__/graphics/entity/ores/particle/hr-gold-ore-particle-shadow-4.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          scale = 0.5
        }
      }
    }
  }
}
)

data:extend({
	{
    type = "autoplace-control",
    category = "resource",
    name = "gold-ore",
    richness = true,
    order = "b-e"
	},
	{
    type = "noise-layer",
    name = "gold-ore"
	},
	{
    type = "resource",
    icon_size = 64, icon_mipmaps = 3,
    name = "gold-ore",
    icon = "__bzgold__/graphics/icons/gold-ore.png",
    flags = {"placeable-neutral"},
    order="a-b-a",
    map_color = {r=1.00, g=0.90, b=0.10},
    minable =
    {
      hardness = 1,
      mining_particle = "gold-ore-particle",
      mining_time = 1,
      results = {
        {type="item", name="gold-ore", amount=1, probability=.25},
        {type="item", name="stone", amount=1, probability=.75},
      }
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},

    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "gold-ore",
      order = "b-z",
      base_density = 1,
      base_spots_per_km2 = 1,
      has_starting_area_placement = true, -- TODO CHANGE THIS
      regular_rq_factor_multiplier = 1,
      starting_rq_factor_multiplier = 1,
    },

    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
        stages =
        {
          sheet =
          {
      filename = "__bzgold__/graphics/entity/ores/gold-ore.png",
      priority = "extra-high",
      size = 64,
      frame_count = 8,
      variation_count = 8,
      hr_version =
      {
      filename = "__bzgold__/graphics/entity/ores/hr-gold-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
          }
    },
  },
  {
      type = "item",
      name = "gold-ore",
      icon_size = 128,
      icon = "__bzgold__/graphics/icons/gold-ore.png",
      pictures = {
        {filename="__bzgold__/graphics/icons/gold-ore.png", size=128, scale=0.125},
        {filename="__bzgold__/graphics/icons/gold-ore-1.png", size=128, scale=0.125},
        {filename="__bzgold__/graphics/icons/gold-ore-2.png", size=128, scale=0.125},
        {filename="__bzgold__/graphics/icons/gold-ore-3.png", size=128, scale=0.125},
        {filename="__bzgold__/graphics/icons/gold-ore-4.png", size=128, scale=0.125},
      },
      subgroup = "raw-resource",
      order = "t-c-a",
      stack_size = util.get_stack_size(50)
  },
})
