local util = require("data-util");

-- Update 248k gold production chain to include gold ore
util.add_ingredient("fi_pure_gold_recipe", "gold-ore", 10)
util.add_to_product("fi_pure_gold_recipe", "fi_materials_pure_gold", 2)

