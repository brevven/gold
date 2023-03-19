local util = require("data-util");


if util.me.alchemy() then
  data:extend({
    {
      type = "recipe",
      name = "alchemy",
      main_product = "gold-ingot",
      category = "smelting",
      order = "d[gold-ingot]2",
      enabled = false,
      energy_required = 16,
      ingredients = {{"lead-plate", 2}},
      results = {{"gold-ingot", 1}},
      icons = {
        {
          icon = "__bzgold__/graphics/icons/gold-ingot.png",
          icon_size = 128,
        },
        {
          icon = "__bzlead__/graphics/icons/lead-plate.png",
          icon_size = 64, icon_mipmaps = 4, shift = {-8,-8}, scale=0.25,
        },
      },
    },
    {
      type = "technology",
      name = "alchemy",
      icons = {
        {
          icon = "__bzgold__/graphics/technology/gold-processing.png",
          icon_size = 256,
        },
        {
          icon = "__bzlead__/graphics/icons/lead-plate.png",
          icon_size = 64, icon_mipmaps = 4, shift = {-48,-48}, scale=2,
        },
      },
      effects = {
        { type = "unlock-recipe", recipe = "alchemy" },
      },
      unit = {
        count = 250, time = 30,
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
        },
      },
      prerequisites = {"gold-processing"},
      order = "b-b",
    },
  })
end
