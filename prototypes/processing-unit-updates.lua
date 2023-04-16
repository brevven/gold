local util = require("data-util")

util.remove_ingredient("processing-unit", "silicon")
util.remove_ingredient("processing-unit", "silicon-wafer")
util.remove_ingredient("processing-unit", "sulfuric-acid")
util.remove_ingredient("processing-unit", "electronic-circuit")
util.remove_ingredient("processing-unit", "advanced-circuit")
util.remove_ingredient("processing-unit", "rare-metals") -- k2
util.add_ingredient("processing-unit", "cpu", 1)
util.set_recipe_time("processing-unit", 2)
util.add_ingredient("processing-unit", "mainboard", 1)

util.add_unlock("se-processing-unit-holmium", "cpu-holmium")
util.add_unlock("se-processing-unit-holmium", "mainboard-holmium")
util.remove_recipe_effect("se-processing-unit-holmium", "se-processing-unit-holmium")
util.remove_raw("recipe", "se-processing-unit-holmium")
