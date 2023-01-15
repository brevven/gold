local util = require("data-util");

if mods.bzsilicon then
local silicon = data.raw.item["silicon-wafer"] and {"silicon-wafer", 30} or {"silicon", 15}
local spreader = data.raw.item["cuw"] and {"cuw", 2} or {"copper-plate", 2}
data:extend({
  {
    type = "item",
    name = "cpu",
    icon = "__base__/graphics/technology/advanced-electronics-2.png",
    icon_size = 256,
    subgroup = "intermediate-product",
    order = "b[cpu]",
    stack_size = util.get_stack_size(200),
  },
  {
    type = "recipe",
    name = "cpu",
    category = "crafting-with-fluid",
    order = "d[mainboard]",
    enabled = false,
    energy_required = 50,
    ingredients = {
      silicon,
      spreader,
      {"gold-ingot", 1},
      {"electronic-circuit", 10},
      {type="fluid", name="sulfuric-acid", amount=50},
    },
    results = {{"cpu", 10}},
  },
})
util.replace_ingredient("cpu", "electronic-circuit", "pcb", 10, false, {"force", true})
end
