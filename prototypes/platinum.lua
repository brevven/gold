local util = require("data-util");

if util.me.platinum() then
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
    enabled = false,
    energy_required = 1.6,
    ingredients = {{"platinum-powder", 1}},
    results = {{"platinum-ingot", 1}},
  },
})
data:extend({
  {
    type = "technology",
    name = "platinum-processing",
    icons = {
      {
        icon = "__bzgold__/graphics/technology/platinum-processing.png",
        icon_size = 256,
      },
    },
    effects = {
      { type = "unlock-recipe", recipe = "palladium-ingot" },
      { type = "unlock-recipe", recipe = "rich-copper" },
    },
    unit = {
      count = 50, time = 30,
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
end
