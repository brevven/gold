local resource_autoplace = require('resource-autoplace');
local noise = require('noise');

local util = require("data-util");

if util.me.platinum() or util.me.palladium() then
if mods.Krastorio2 then -- no rich copper

  util.multiply_recipe("rare-metals", 2)
  util.multiply_recipe("rare-metals-2", 2)

  util.set_main_product("rare-metals", "rare-metals")
  util.set_main_product("rare-metals-2", "rare-metals")

  if util.me.platinum() and util.me.palladium() then
    util.replace_some_product("rare-metals",   "rare-metals", 2, "platinum-powder",  2, {force=true})
    util.replace_some_product("rare-metals",   "rare-metals", 2, "palladium-powder", 2, {force=true})
    util.replace_some_product("rare-metals-2", "rare-metals", 3, "platinum-powder",  3, {force=true})
    util.replace_some_product("rare-metals-2", "rare-metals", 3, "palladium-powder", 3, {force=true})
  elseif util.me.platinum() then
    util.replace_some_product("rare-metals",   "rare-metals", 3, "platinum-powder",  3, {force=true})
    util.replace_some_product("rare-metals-2", "rare-metals", 6, "platinum-powder",  6, {force=true})
  elseif util.me.palladium() then
    util.replace_some_product("rare-metals",   "rare-metals", 3, "palladium-powder", 3, {force=true})
    util.replace_some_product("rare-metals-2", "rare-metals", 6, "palladium-powder", 6, {force=true})
  end
else

local results = {}
if util.me.silver() and util.me.platinum() and util.me.palladium() then
  results = {
    {type="item", name="copper-plate", amount=1},
    {type="item", name="silver-ore", amount=1, probability=0.5},
    {type="item", name="platinum-powder", amount=1, probability=0.25},
    {type="item", name="palladium-powder", amount=1, probability=0.25},
  }
elseif util.me.silver() and util.me.platinum() then
  results = {
    {type="item", name="copper-plate", amount=1},
    {type="item", name="silver-ore", amount=1, probability=0.67},
    {type="item", name="platinum-powder", amount=1, probability=0.33},
  }
elseif util.me.silver() and util.me.palladium() then
  results = {
    {type="item", name="copper-plate", amount=1},
    {type="item", name="silver-ore", amount=1, probability=0.67},
    {type="item", name="palladium-powder", amount=1, probability=0.33},
  }
elseif util.me.platinum() and util.me.palladium() then
  results = {
    {type="item", name="copper-plate", amount=1},
    {type="item", name="platinum-powder", amount=1, probability=0.5},
    {type="item", name="palladium-powder", amount=1, probability=0.5},
  }
elseif util.me.platinum() then
  results = {
    {type="item", name="copper-plate", amount=2, probability = 0.75},
    {type="item", name="platinum-powder", amount=1, probability=0.5},
  }
elseif util.me.palladium() then
  results = {
    {type="item", name="copper-plate", amount=2, probability = 0.75},
    {type="item", name="palladium-powder", amount=1, probability=0.5},
  }
else -- should never happen
  results = {
    {type="item", name="copper-plate", amount=2},
  }
end
 

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
      base_density = mods.bzaluminum and 3 or 4,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1.1,
      starting_rq_factor_multiplier = 1.1,
      candidate_spot_count = 22,
    }
  end
end

if util.se6() then
  data:extend({
    {
      type = "autoplace-control",
      category = "resource",
      name = "rich-copper-ore",
      richness = true,
      order = "zzzzzzzzzzz"
    },
  })
end

data:extend({
	{
    type = "noise-layer",
    name = "rich-copper-ore"
	},
	{
    type = "resource",
    name = "rich-copper-ore",
    icon = "__bzgold__/graphics/icons/rich-copper-ore.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral"},
    order="a-b-a",
    map_color = {r=0.9, g=0.5, b=0.4},
    minable =
    {
      hardness = 1,
      mining_particle = "copper-ore-particle",
      mining_time = 1,
      fluid_amount = 1,
      required_fluid = "water",
      result = "rich-copper-ore"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},

    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "rich-copper-ore",
      autoplace_control_name = util.se6() and "rich-copper-ore" or "copper-ore",
      order = "b-z",
      base_density = 4,
      base_spots_per_km2 = 1,
      has_starting_area_placement = false,
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
      {icon = "__bzgold__/graphics/icons/rich-copper-ore.png", icon_size = 64, scale=0.25, shift = {-8,8}},
      -- {icon = "__bzgold__/graphics/icons/silver-ore.png", icon_size = 128, scale=0.125, shift = {8,8}},
      -- {icon = "__bzgold__/graphics/icons/platinum-powder.png", icon_size = 64, scale=0.25, shift = {8,-8}},
      -- {icon = "__bzgold__/graphics/icons/palladium-powder.png", icon_size = 64, scale=0.25, shift = {-8,-8}},
    },
    energy_required = 6.4,
    ingredients = {{"rich-copper-ore", 2}},
    results = results,
  },
})
util.add_unlock("platinum-processing", "rich-copper")
util.add_unlock("palladium-processing", "rich-copper")

if util.se6() then
  se_resources["rich-copper-ore"] = {
    order = "b-z-c",
    has_starting_area_placement = false,
    base_density = 4,
    base_spots_per_km2 = 1,
  }
end
end
end
