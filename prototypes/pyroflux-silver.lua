local util = require("data-util");

if util.se6() and util.me.silver() then
  data:extend({
  {
    type = "item",
    name = "silver-ingot",
    icons = {{icon = "__bzgold__/graphics/icons/silver-ingot.png", icon_size = 128}},
    order = "b-b",
    stack_size = 50,
    subgroup = "silver",
  },
  {
    type = "fluid",
    name = "molten-silver",
    default_temperature = 600,
    max_temperature = 600,
    base_color = {r=.8, g=.80, b=.80},
    flow_color = {r=.8, g=.80, b=.80},
    icons = {{icon = "__bzgold__/graphics/icons/molten-silver.png", icon_size = 128}},
    order = "a[molten]-a",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false,
    subgroup = "fluid",
  },
  {
    type = "recipe",
    category = "smelting",
    name = "molten-silver",
    main_product = "molten-silver",
    subgroup = "silver",
    results = {
      {type = "fluid", name = "molten-silver", amount = mods.Krastorio2 and 750 or 900},
    },
    energy_required = 60,
    ingredients = {
      {name = mods.Krastorio2 and "enriched-silver" or "silver-ore", amount = 24},
      {type = "fluid", name = "se-pyroflux", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-a"
  },
  {
    type = "recipe",
    name = "silver-ingot",
    category = "casting",
    results = {{"silver-ingot", 1}},
    energy_required = 25,
    ingredients = {
      {type = "fluid", name = "molten-silver", amount = 250},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    category = "crafting",
    name = "silver-ingot-to-plate",

    icons = {
      {icon = "__bzgold__/graphics/icons/silver-plate.png", icon_size = 128, icon_mipmaps = 3},
      {icon = "__bzgold__/graphics/icons/silver-ingot.png", icon_size = 128, scale = 0.125, shift = {-8, -8}},
    },
    results = {
      {name = "silver-plate", amount = 10},
    },
    energy_required = 5,
    ingredients = {
      {name = "silver-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-c-b"
  },
  })
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "molten-silver"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "silver-ingot"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "silver-ingot-to-plate"})
end
