local util = require("data-util");


if not mods.bobelectronics then
  data:extend({
    {
      type = "item",
      name = "mainboard",
      icon = "__bzgold__/graphics/icons/mainboard.png",
      icon_size = 128,
      subgroup = "intermediate-product",
      order = "b[mainboard]",
      stack_size = util.get_stack_size(200),
    },
    {
      type = "recipe",
      name = "mainboard",
      category = "crafting",
      order = "d[mainboard]",
      enabled = false,
      energy_required = 2.5,
      ingredients = {{"advanced-circuit", 10}, {"gold-ingot", 1}},
      results = {{"mainboard", 10}},
    },
  })
  if util.me.platinum() then
    util.add_ingredient("mainboard", "temperature-sensor", 10, {"force", true})
  end
  if util.me.palladium() then
    util.add_ingredient("mainboard", "mlcc", 10, {"force", true})
  end
else
  util.remove_ingredient("superior-circuit-board", "copper-plate")
  util.remove_ingredient("superior-circuit-board", "tin-plate")
  util.remove_ingredient("superior-circuit-board", "fibreglass-board")
  util.remove_ingredient("superior-circuit-board", "ferric-chloride-solution")
  util.multiply_recipe("superior-circuit-board", 10)
  util.add_ingredient("superior-circuit-board", "advanced-circuit", 10)
  util.add_ingredient("superior-circuit-board", "gold-ingot", 1)
  if util.me.platinum() then
    util.add_ingredient("superior-circuit-board", "temperature-sensor", 10)
  end
  if util.me.palladium() then
    util.add_ingredient("superior-circuit-board", "mlcc", 10)
  end
end
