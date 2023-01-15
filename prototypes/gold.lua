local util = require("data-util");

data:extend({
  {
    type = "item",
    name = "gold-ingot",
    icon = "__bzgold__/graphics/icons/gold-ingot.png",
    icon_size = 128,
    subgroup = "raw-resource",
    order = "b[gold-ingot]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "gold-ingot",
    category = "smelting",
    order = "d[gold-ingot]",
    enabled = true,
    energy_required = 1.6,
    ingredients = {{"gold-ore", 1}},
    results = {{"gold-ingot", 1}},
  },
  {
    type = "technology",
    name = "gold-processing",
    icons = {
      {
        icon = "__bzgold__/graphics/technology/gold-processing.png",
        icon_size = 256,
      },
    },
    effects = {
      { type = "unlock-recipe", recipe = "gold-ingot" },
    },
    unit = {
      count = 100, time = 15,
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
