local util = require("data-util");

if util.me.silver() then
  data:extend({
    {
      type = "item",
      name = "silver-ore",
      icon = "__bzgold__/graphics/icons/silver-ore.png",
      icon_size = 128,
      pictures = {
        {filename="__bzgold__/graphics/icons/silver-ore.png", size=128, scale=0.125},
        {filename="__bzgold__/graphics/icons/silver-ore-1.png", size=128, scale=0.125},
        {filename="__bzgold__/graphics/icons/silver-ore-2.png", size=128, scale=0.125},
        {filename="__bzgold__/graphics/icons/silver-ore-3.png", size=128, scale=0.125},
        {filename="__bzgold__/graphics/icons/silver-ore-4.png", size=128, scale=0.125},
      },
      subgroup = "raw-resource",
      order = "b[silver-plate]",
      stack_size = util.get_stack_size(200),
    },
  })
  data:extend({
    {
      type = "item",
      name = "silver-plate",
      icon = "__bzgold__/graphics/icons/silver-plate.png",
      icon_size = 128,
      subgroup = "raw-resource",
      order = "b[silver-plate]",
      stack_size = util.get_stack_size(100),
    },
    {
      type = "recipe",
      name = "silver-plate",
      category = "smelting",
      order = "d[silver-plate]",
      enabled = true,
      energy_required = 1.6,
      ingredients = {{"silver-ore", 1}},
      results = {{"silver-plate", 4}},
    },
  })

  data:extend({
    {
      type = "item",
      name = "silver-wire",
      icon = "__bzgold__/graphics/icons/silver-wire.png",
      icon_size = 64, icon_mipmaps = 4,
      subgroup = util.cablesg,
      order = "b[silver-wire]",
      stack_size = util.get_stack_size(200),
    },
    {
      type = "recipe",
      name = "silver-wire",
      category = "crafting",
      order = "d[silver-wire]",
      enabled = true,
      energy_required = 1,
      ingredients = {{"silver-plate", 1}},
      results = {{"silver-wire", 4}},
    },
  })

  data:extend({
    {
      type = "technology",
      name = "silver-processing",
      icons = {
        {
          icon = "__bzgold__/graphics/icons/silver-plate.png",
          icon_size = 128,
        },
        {
          icon = "__bzgold__/graphics/icons/silver-wire.png",
          icon_size = 64, icon_mipmaps=4,
        },
      },
      effects = {
        { type = "unlock-recipe", recipe = "silver-plate" },
        { type = "unlock-recipe", recipe = "silver-wire" },
      },
      unit = {
        count = 40, time = 15,
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1}
        },
      },
      prerequisites = {"advanced-material-processing"},
      order = "b-b",
    },
  })
end
