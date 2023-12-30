local util = require("data-util");


if not (mods.bobelectronics or mods.MDbobelectronics) then

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
   
  if mods["space-exploration"] then
    data:extend({
      {
        type = "recipe",
        name = "mainboard-holmium",
        icons = {
          { icon = "__bzgold__/graphics/icons/mainboard.png", icon_size = 128 },
          { icon = "__space-exploration-graphics__/graphics/icons/holmium-solenoid.png", icon_size = 64, scale=.25, shift={-8, -8} },
        },
        category = "crafting-with-fluid",
        order = "d[mainboard]",
        enabled = false,
        energy_required = 5,
        ingredients = {{"se-holmium-cable", 2}, {"advanced-circuit", 20}, {"gold-ingot", 1}},
        results = {{"mainboard", 20}},
      },
    })
  end


  if util.me.platinum() then
    util.add_ingredient("mainboard", "temperature-sensor", 10, {"force", true})
    util.add_ingredient("mainboard-holmium", "temperature-sensor", 10, {"force", true})
  end
  if util.me.palladium() then
    util.add_ingredient("mainboard", "mlcc", 10, {"force", true})
    util.add_ingredient("mainboard-holmium", "mlcc", 10, {"force", true})
  end
  if mods.Krastorio2 then
    util.add_ingredient("mainboard", "rare-metals", 20, {"force", true})
    util.add_ingredient("mainboard-holmium", "rare-metals", 20, {"force", true})
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
