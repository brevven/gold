local util = require("data-util");

if util.me.platinum() then

local base = "stone"
if mods.bzzirconium then
  base = "zirconia"
elseif mods.bzaluminum then
  base = "alumina"
elseif mods.bzsilicon then
  base = "silica"
elseif mods.Krastorio2 or mods["aai-industry"] or mods["sand-and-glass"] then
  base = "glass"
end


data:extend({
  {
    type = "item",
    name = "temperature-sensor",
    icon = "__bzgold__/graphics/icons/temperature-sensor.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "b[gold-ingot]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "temperature-sensor",
    category = "crafting",
    order = "d[temperature-sensor]",
    enabled = false,
    energy_required = 4,
    ingredients = {{"platinum-ingot", 1}, {base, 2}},
    results = {{"temperature-sensor", 10}},
  },
  {
    type = "technology",
    name = "temperature-regulation",
    icons = {
      {
        icon = "__bzgold__/graphics/technology/temperature-sensor.png",
        icon_size = 256,
      },
    },
    effects = {
      { type = "unlock-recipe", recipe = "temperature-sensor" },
    },
    unit = {
      count = 50, time = 15,
      ingredients = util.se6() and 
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"se-rocket-science-pack", 1},
      } or {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
    },
    prerequisites = {"platinum-processing"},
    order = "b-b",
  },
})
end
