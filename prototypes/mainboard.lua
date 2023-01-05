local util = require("data-util");


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
