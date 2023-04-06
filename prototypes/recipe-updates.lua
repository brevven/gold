local futil = require("util");
local util = require("data-util")

-- K2 silver from copper
if mods.Krastorio2 then
  util.replace_some_product("copper-plate", "copper-plate", 1, "silver-ore", 1)
  util.add_product("enriched-copper", {"silver-ore", 1})
end

if mods.bztitanium then
  util.replace_ingredient("heat-exchanger", util.titanium_plate, "titanium-palladium-flange")
  util.replace_some_ingredient("steam-turbine", util.titanium_plate, 10, "titanium-palladium-flange", 10)
  util.replace_some_ingredient("kr-advanced-steam-turbine", util.titanium_plate, 10, "titanium-palladium-flange", 10)
else
  util.add_ingredient("heat-exchanger", "titanium-palladium-flange", 10)
  util.add_ingredient("steam-turbine", "titanium-palladium-flange", 10)
  util.add_ingredient("kr-advanced-steam-turbine", "titanium-palladium-flange", 10)
end
if not mods["space-exploration"] then
  util.add_ingredient("rocket-silo", "titanium-palladium-flange", 100)
  util.add_ingredient("rocket-control-unit", "temperature-sensor", 1)
end

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

util.add_ingredient("gas-extractor", "silver-brazing-alloy", 10)
util.add_ingredient("pumpjack", "silver-brazing-alloy", 10)
util.add_ingredient("kr-mineral-water-pumpjack", "silver-brazing-alloy", 5)
util.add_ingredient("assembling-machine-2", "silver-brazing-alloy", 5)
util.add_ingredient("basic-chemical-plant", "silver-brazing-alloy", 5)
util.replace_ingredient("chemical-plant", "solder", "silver-brazing-alloy")
util.add_ingredient("chemical-plant", "silver-brazing-alloy", 20)
util.add_ingredient("chemical-plant", "silver-plate", 5)
util.replace_ingredient("oil-refinery", "solder", "silver-brazing-alloy")
util.add_ingredient("oil-refinery", "silver-brazing-alloy", 20)
util.add_ingredient("rocket-silo", "silver-brazing-alloy", 100)

util.multiply_recipe("solar-cell", 2)
util.replace_ingredient("solar-cell", "lead-plate", "silver-plate", 1)
util.add_ingredient("solar-cell", "silver-plate", 1)

if not util.se6() then
  util.add_ingredient("satellite", "gold-ingot", 10)
end

util.add_ingredient("jet", "platinum-ingot", 10)
util.add_ingredient("flying-fortress", "platinum-ingot", 10)

-- K2
util.add_ingredient("kr-bio-lab", "silver-plate", 1)
util.add_ingredient("kr-quantum-computer", "mlcc", 50)


if util.me.palladium() then
  util.add_ingredient("additional-engine", "palladium-ingot", 1)
elseif util.me.platinum() then
  util.add_ingredient("additional-engine", "platinum-ingot", 1)
end

-- K2 blank tech card
if mods.Krastorio2 and util.me.silver() then
  local tc = futil.table.deepcopy(data.raw.recipe["blank-tech-card"])
  tc.name = "blank-tech-card-silver"
  data:extend({tc})
  util.replace_ingredient("blank-tech-card-silver", "copper-cable", "silver-wire")
  local amt = util.get_amount("blank-tech-card")
  util.set_product_amount("blank-tech-card-silver", "blank-tech-card", amt)
  util.add_icon("blank-tech-card-silver", {
    icon = "__bzgold__/graphics/icons/silver-wire.png",
    icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {8,-8}
  })
  util.add_unlock("silver-processing", "blank-tech-card-silver")
end
