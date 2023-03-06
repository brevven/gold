local util = require("data-util");

if util.me.catalysis() then
  if util.me.palladium() or util.me.platinum() then
  data:extend({
    {
      type = "item",
      name = "ptpd-catalyst",
      icon = "__bzgold__/graphics/icons/ptpd-catalyst.png",
      icon_size = 128,
      pictures = {
        {filename="__bzgold__/graphics/icons/ptpd-catalyst.png", size=128, scale=0.125},
        {filename="__bzgold__/graphics/icons/ptpd-catalyst-1.png", size=128, scale=0.125},
        {filename="__bzgold__/graphics/icons/ptpd-catalyst-2.png", size=128, scale=0.125},
        {filename="__bzgold__/graphics/icons/ptpd-catalyst-3.png", size=128, scale=0.125},
      },
      subgroup = "intermediate-product",
      order = "b[catalyst]",
      stack_size = util.get_stack_size(100),
    },
    {
      type = "technology",
      name = "catalysis",
      icons = {
        {
          icon = "__base__/graphics/technology/oil-processing.png",
          icon_size = 256,
        },
      },
      effects = {},
      unit = {
        count = 100, time = 20,
        ingredients = { 
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
        },
      },
      prerequisites = {"production-science-pack", "advanced-oil-processing"},
      order = "b-b",
    },
  })
  end


  local base = "stone"
  if mods.bzaluminum then base = "alumina"
  elseif mods.bzsilicon then base = "silica"
  end

  local fluid = "sulfuric-acid"
  if data.raw.fluid["hydrogen-chloride"] then fluid = "hydrogen-chloride"
  end

  if util.me.palladium() then
  data:extend({
    {
      type = "recipe",
      name = "pd-catalyst",
      main_product = "ptpd-catalyst",
      category = "chemistry",
      order = "d[catalyst]",
      enabled = false,
      energy_required = 1.6,
      ingredients = {
        {base, 1},
        {"palladium-ingot", 1},
        {type="fluid", name=fluid, amount=100, catalyst_amount=100},
      },
      results = {
        {"ptpd-catalyst", 1},
        {type="fluid", name=fluid, amount=90, catalyst_amount=90},
        {type="fluid", name="water", amount=10, catalyst_amount=9},
      },
    },
  })
  end
  if util.me.platinum() then
  data:extend({
    {
      type = "recipe",
      name = "pt-catalyst",
      main_product = "ptpd-catalyst",
      category = "chemistry",
      order = "d[catalyst]",
      enabled = false,
      energy_required = 1.6,
      ingredients = {
        {base, 1},
        {"platinum-ingot", 1},
        {type="fluid", name=fluid, amount=100, catalyst_amount=100},
      },
      results = {
        {"ptpd-catalyst", 1},
        {type="fluid", name=fluid, amount=90, catalyst_amount=90},
        {type="fluid", name="water", amount=10, catalyst_amount=9},
      },
    },
  })
  end
  util.add_unlock("catalysis", "pt-catalyst")
  util.add_unlock("catalysis", "pd-catalyst")
end

