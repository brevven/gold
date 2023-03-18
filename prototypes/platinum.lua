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
    main_product = "platinum-ingot",
    category = "smelting",
    order = "d[platinum-ingot]",
    enabled = false,
    energy_required = 1.6,
    ingredients = {{"platinum-powder", 1}},
    results = util.me.byproduct() and 
    {
      {type="item", name="platinum-ingot", amount=1, probability=0.95},
      {type="item", name="sulfur", amount=1, probability=0.05},
    } or {{"platinum-ingot", 1}},
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
      { type = "unlock-recipe", recipe = "platinum-ingot" },
    },
    unit = {
      count = 50, time = 30,
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
    prerequisites = mods["space-exploration"] and {"se-rocket-science-pack"} or {"chemical-science-pack"},
    order = "b-b",
  },
})
end
