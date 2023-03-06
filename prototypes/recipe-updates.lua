local util = require("data-util")

-- K2 silver from copper
if mods.Krastorio2 then
  util.replace_some_product("copper-plate", "copper-plate", 1, "silver-ore", 1)
  util.add_product("enriched-copper", {"silver-ore", 1})
end

if mods.bztitanium then
  util.replace_ingredient("heat-exchanger", util.titanium_plate, "titanium-palladium-flange")
  util.replace_some_ingredient("steam-turbine", util.titanium_plate, 10, "titanium-palladium-flange", 10)
else
  util.add_ingredient("heat-exchanger", "titanium-palladium-flange", 10)
  util.add_ingredient("steam-turbine", "titanium-palladium-flange", 10)
  util.add_ingredient("rocket-silo", "titanium-palladium-flange", 100)
end

util.add_ingredient("rocket-control-unit", "temperature-sensor", 1)
if not mods["aai-industry"] then
  util.add_ingredient("electric-furnace", "temperature-sensor", 1)
else
  util.add_ingredient("industrial-furnace", "temperature-sensor", 2)
end

util.add_ingredient("speed-module-3", "mlcc", 5)
util.add_ingredient("effectivity-module-3", "mlcc", 5)
util.add_ingredient("productivity-module-3", "mlcc", 5)
util.remove_ingredient("speed-module-3", "cermet")
util.remove_ingredient("effectivity-module-3", "cermet")
util.remove_ingredient("productivity-module-3", "cermet")

util.replace_ingredient("chemical-plant", "solder", "silver-brazing-alloy")
util.add_ingredient("chemical-plant", "silver-brazing-alloy", 5)
util.add_ingredient("chemical-plant", "silver-plate", 5)
util.replace_ingredient("oil-refinery", "solder", "silver-brazing-alloy")
util.add_ingredient("oil-refinery", "silver-brazing-alloy", 5)

util.multiply_recipe("solar-cell", 2)
util.replace_ingredient("solar-cell", "lead-plate", "silver-plate", 1)
util.add_ingredient("solar-cell", "silver-plate", 1)
