local util = require("data-util");


if util.se6() then
  data:extend({
  {
    type = "fluid",
    name = "molten-gold",
    default_temperature = 600,
    max_temperature = 600,
    base_color = {r=.9, g=.8, b=.3},
    flow_color = {r=.9, g=.8, b=.3},
    icons = {{icon = "__bzgold__/graphics/icons/molten-gold.png", icon_size = 128}},
    order = "a[molten]-a",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false,
    subgroup = "fluid",
  },
  {
    type = "recipe",
    category = "smelting",
    name = "molten-gold",
    main_product = "molten-gold",
    subgroup = "gold",
    results = {
      {type = "fluid", name = "molten-gold", amount = mods.Krastorio2 and 750 or 900},
    },
    energy_required = 60,
    ingredients = {
      {name = mods.Krastorio2 and "enriched-gold" or "gold-ore", amount = 24},
      {type = "fluid", name = "se-pyroflux", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-a"
  },
  {
    type = "recipe",
    name = "gold-ingot-casting",
    category = "casting",
    results = {{"gold-ingot", 1}},
    energy_required = 2.5,
    ingredients = {
      {type = "fluid", name = "molten-gold", amount = 50},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
  })
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "molten-gold"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "gold-ingot-casting"})
  if mods["Krastorio2"] then
    util.set_item_subgroup("enriched-gold", "lead")
    data.raw.recipe["enriched-gold-ingot"].order = "d[gold-ingot]"
    se_delivery_cannon_recipes["enriched-gold"] = {name= "enriched-gold"}
  else
    if util.me.byproduct() then util.add_product("molten-gold", {"silver-ore", 9}) end
  end
end
