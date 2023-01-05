local resource_autoplace = require('resource-autoplace');
local noise = require('noise');

local util = require("data-util");

if util.me.platinum() or util.me.palladium() then

local base_density = mods.bzaluminum and 3 or 4


if data.raw.resource["copper-ore"] then
  if mods["space-exploration"] then
    local noise = require('noise');
    -- decrease richness of copper a bit (ok if it stacks with aluminum)
    data.raw.resource["copper-ore"].autoplace.richness_expression = 
      data.raw.resource["copper-ore"].autoplace.richness_expression * noise.to_noise_expression(3/4)
  else
    log("Replacing vanilla copper-ore autoplace")
    local resource_autoplace = require('resource-autoplace');
    data.raw.resource["copper-ore"].autoplace = resource_autoplace.resource_autoplace_settings{
      name = "copper-ore",
      order = "b",
      base_density = base_density,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1.1,
      starting_rq_factor_multiplier = 1.1,
      candidate_spot_count = 22,
    }
  end
end

data:extend({
	--{
  --  type = "autoplace-control",
  --  category = "resource",
  --  name = "rich-copper-ore",
  --  richness = true,
  --  order = "b-e"
	--},
	{
    type = "noise-layer",
    name = "rich-copper-ore"
	},
	{
    type = "resource",
    icon_size = 64, icon_mipmaps = 3,
    name = "rich-copper-ore",
    icon = "__bzgold__/graphics/icons/rich-copper-ore.png",
    flags = {"placeable-neutral"},
    order="a-b-a",
    map_color = {r=0.9, g=0.5, b=0.4},
    minable =
    {
      hardness = 1,
      mining_particle = "copper-ore-particle",
      mining_time = 1,
      result = "rich-copper-ore"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},

    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "rich-copper-ore",
      autoplace_control_name = "copper-ore",
      order = "b-z",
      base_density = base_density,
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
      filename = "__bzgold__/graphics/entity/ores/rich-copper-ore.png",
      priority = "extra-high",
      size = 64,
      frame_count = 8,
      variation_count = 8,
      hr_version =
      {
      filename = "__bzgold__/graphics/entity/ores/hr-rich-copper-ore.png",
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
      name = "rich-copper-ore",
      icon_size = 64, icon_mipmaps=4,
      icon = "__bzgold__/graphics/icons/rich-copper-ore.png",
      pictures = {
        {filename="__bzgold__/graphics/icons/rich-copper-ore.png", size=64, scale=0.25},
        {filename="__bzgold__/graphics/icons/rich-copper-ore-1.png", size=64, scale=0.25},
        {filename="__bzgold__/graphics/icons/rich-copper-ore-2.png", size=64, scale=0.25},
        {filename="__bzgold__/graphics/icons/rich-copper-ore-3.png", size=64, scale=0.25},
      },
      subgroup = "raw-resource",
      order = "t-c-a",
      stack_size = util.get_stack_size(50)
  },
})


data:extend({
  {
    type = "recipe",
    name = "rich-copper",
    category = "smelting",
    main_product = "copper-plate",
    order = "d[copper-plate]",
    enabled = false,
    icons = {
      {icon = "__base__/graphics/icons/copper-plate.png", icon_size = 64, icon_mipmaps=4},
      {icon = "__bzgold__/graphics/icons/silver-ore.png", icon_size = 128, scale=0.25, shift = {8,8}},
      {icon = "__bzgold__/graphics/icons/platinum-powder.png", icon_size = 64, scale=0.5, shift = {8,-8}},
      {icon = "__bzgold__/graphics/icons/palladium-powder.png", icon_size = 64, scale=0.5, shift = {-8,8}},
    },
    energy_required = 6.4,
    ingredients = {{"rich-copper-ore", 1}},
    results = {
      {type="item", name="copper-plate", amount=1},
      {type="item", name="silver-ore", amount=1, probability=0.5},
      {type="item", name="platinum-powder", amount=1, probability=0.25},
      {type="item", name="palladium-powder", amount=1, probability=0.25},
    },
  },
})
end
