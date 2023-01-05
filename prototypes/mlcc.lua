local util = require("data-util");

if util.me.palladium() then

local ingredients = {{"palladium-ingot", 1}, {"stone", 2}}
if mods.bzzirconium and mods.bzaluminum then
  ingredients = {{"palladium-ingot", 1}, {"zirconia", 1}, {"alumina", 1}}
elseif mods.bzzirconium then
  ingredients = {{"palladium-ingot", 1}, {"zirconia", 2}}
elseif mods.bzaluminum then
  ingredients = {{"palladium-ingot", 1}, {"alumina", 2}}
elseif mods.bzsilicon then
  ingredients = {{"palladium-ingot", 1}, {"silica", 3}}
elseif mods.Krastorio2 or mods["aai-industry"] or mods["sand-and-glass"] then
  ingredients = {{"palladium-ingot", 1}, {"sand", 2}}
end

data:extend({
  {
    type = "item",
    name = "mlcc",
    icon = "__bzgold__/graphics/icons/mlcc.png",
    icon_size = 128,
      pictures = {
        {filename="__bzgold__/graphics/icons/mlcc.png", size=128, scale=0.09375},
        {filename="__bzgold__/graphics/icons/mlcc-1.png", size=128, scale=0.09375},
        {filename="__bzgold__/graphics/icons/mlcc-2.png", size=128, scale=0.09375},
        {filename="__bzgold__/graphics/icons/mlcc-3.png", size=128, scale=0.09375},
        {filename="__bzgold__/graphics/icons/mlcc-4.png", size=128, scale=0.09375},
        -- {filename="__bzgold__/graphics/icons/mlcc.png", size=128, scale=0.0625},
        -- {filename="__bzgold__/graphics/icons/mlcc-1.png", size=128, scale=0.0625},
        -- {filename="__bzgold__/graphics/icons/mlcc-2.png", size=128, scale=0.0625},
        -- {filename="__bzgold__/graphics/icons/mlcc-3.png", size=128, scale=0.0625},
        -- {filename="__bzgold__/graphics/icons/mlcc-4.png", size=128, scale=0.0625},
      },
    subgroup = "intermediate-product",
    order = "b[gold-ingot]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "mlcc",
    category = "crafting",
    order = "d[mlcc]",
    enabled = false,
    energy_required = 4,
    ingredients = ingredients,
    results = {{"mlcc", 10}},
  },
  {
    type = "technology",
    name = "advanced-capacitors",
    icons = {
      {
        icon = "__bzgold__/graphics/technology/mlcc.png",
        icon_size = 256,
      },
    },
    effects = {
      { type = "unlock-recipe", recipe = "mlcc" },
    },
    unit = {
      count = 50, time = 15,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
    },
    prerequisites = {"palladium-processing"},
    order = "b-b",
  },
})
end
