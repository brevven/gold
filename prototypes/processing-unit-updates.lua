local util = require("data-util")

if mods.bzsilicon then
  util.remove_ingredient("processing-unit", "silicon")
  util.remove_ingredient("processing-unit", "silicon-wafer")
  util.remove_ingredient("processing-unit", "sulfuric-acid")
  util.remove_ingredient("processing-unit", "electronic-circuit")
  util.remove_ingredient("processing-unit", "advanced-circuit")
  --util.set_ingredient("processing-unit", "electronic-circuit", 1)
  --util.set_ingredient("processing-unit", "advanced-circuit", 1)
  util.add_ingredient("processing-unit", "cpu", 1)
  util.set_recipe_time("processing-unit", 4)
end
util.add_ingredient("processing-unit", "mainboard", 1)
