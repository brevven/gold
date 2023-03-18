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
      order = "a[silver-ore]",
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
    mods.Krastorio2 and {
      type = "recipe",
      name = "silver-plate",
      category = "smelting",
      order = "d[silver-plate]",
      enabled = false,
      energy_required = 8,
      ingredients = {{"silver-ore", 10}},
      results = {{"silver-plate", 5}},
    } or {
      type = "recipe",
      name = "silver-plate",
      category = "smelting",
      order = "d[silver-plate]",
      enabled = false,
      energy_required = 1.6,
      ingredients = {{"silver-ore", 1}},
      results = {{"silver-plate", 1}},
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
      enabled = false,
      energy_required = 1,
      ingredients = {{"silver-plate", 1}},
      results = {{"silver-wire", 3}},
    },
  })

  brazing = mods.BrassTacks and {
    {"silver-plate", 2},
    {"zinc-plate", 1},
    {"copper-plate", 1}
  } or {
    {"silver-plate", 2},
    {"copper-plate", 2}
  }
  
  data:extend({
    {
      type = "item",
      name = "silver-brazing-alloy",
      icon = "__bzgold__/graphics/icons/silver-brazing-alloy.png",
      icon_size = 128,
      subgroup = "intermediate-product",
      order = "b[silver-brazing-alloy]",
      stack_size = util.get_stack_size(100),
    },
    {
      type = "recipe",
      name = "silver-brazing-alloy",
      category = "crafting",
      order = "d[silver-brazing-alloy]",
      enabled = false,
      energy_required = 4,
      ingredients = brazing,
      results = {{"silver-brazing-alloy", 4}},
    },
  })

  local prereqs= mods.bzaluminum and {"copper-processing"} or {"automation"}
  data:extend({
    {
      type = "technology",
      name = "silver-processing",
      icons = {
        {
          icon = "__bzgold__/graphics/technology/silver-processing.png",
          icon_size = 256,
        },
      },
      effects = {
        { type = "unlock-recipe", recipe = "silver-plate" },
        { type = "unlock-recipe", recipe = "silver-wire" },
        { type = "unlock-recipe", recipe = "silver-brazing-alloy" },
      },
      unit = {
        count = 10, time = 15,
        ingredients = { {"automation-science-pack", 1}, },
      },
      prerequisites = prereqs,
      order = "b-b",
    },
  })

  -- replace lead byproducts, set copper byproducts
  util.set_main_product("copper-plate", "copper-plate")
  if mods.bzlead and util.me.lead_byproduct() then
    util.replace_product("lead-plate", "copper-ore", "silver-ore")
    util.replace_product("enriched-lead", "copper-ore", "silver-ore")

    -- small silver byproduct on copper, even if lead is enabled
    if not mods.Krastorio2 and util.me.byproduct() then
      util.add_product("copper-plate", {type=item, name="silver-ore", amount=1, probability=0.1})
    end
  else
    if not mods.Krastorio2 then
      util.multiply_recipe("copper-plate", 4)
      util.replace_some_product("copper-plate", "copper-plate", 1, "silver-ore", 1)
    end
  end
end
