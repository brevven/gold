local util = require("data-util");

data:extend({
  {
    type = "item",
    name = "platinum-powder",
    icon = "__bzgold__/graphics/icons/platinum-powder.png",
    icon_size = 64,
    subgroup = "raw-resource",
    order = "b[platinum-powder]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "item",
    name = "platinum-ingot",
    icon = "__bzgold__/graphics/icons/platinum-ingot.png",
    icon_size = 128,
    subgroup = "raw-resource",
    order = "b[platinum-ingot]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "platinum-ingot",
    category = "smelting",
    order = "d[platinum-ingot]",
    enabled = true,
    energy_required = 1.6,
    ingredients = {{"platinum-powder", 1}},
    results = {{"platinum-ingot", 1}},
  },
})
data:extend({
  {
    type = "item",
    name = "palladium-powder",
    icon = "__bzgold__/graphics/icons/palladium-powder.png",
    icon_size = 64,
    subgroup = "raw-resource",
    order = "b[palladium-powder]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "item",
    name = "palladium-ingot",
    icon = "__bzgold__/graphics/icons/palladium-ingot.png",
    icon_size = 128,
    subgroup = "raw-resource",
    order = "b[palladium-ingot]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "palladium-ingot",
    category = "smelting",
    order = "d[palladium-ingot]",
    enabled = true,
    energy_required = 1.6,
    ingredients = {{"palladium-powder", 1}},
    results = {{"palladium-ingot", 1}},
  },
})
data:extend({
  {
    type = "technology",
    name = "plpd-processing",
    icons = {
      {
        icon = "__bzgold__/graphics/icons/platinum-ingot.png",
        icon_size = 128, shift = {-32,-32},
      },
      {
        icon = "__bzgold__/graphics/icons/palladium-ingot.png",
        icon_size = 128, shift = {32,32},
      },
    },
    effects = {
      { type = "unlock-recipe", recipe = "palladium-ingot" },
      { type = "unlock-recipe", recipe = "platinum-ingot" },
    },
    unit = {
      count = 100, time = 30,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
    },
    prerequisites = mods["space-exploration"] and {"rocket-science-pack"} or {"chemical-science-pack"},
    order = "b-b",
  },
})
