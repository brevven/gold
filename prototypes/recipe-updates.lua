local util = require("data-util")

if mods.bztitanium then
  util.replace_ingredient("heat-exchanger", util.titanium_plate, "titanium-palladium-flange")
  util.replace_some_ingredient("steam-turbine", util.titanium_plate, 10, "titanium-palladium-flange", 10)
else
  util.add_ingredient("heat-exchanger", "titanium-palladium-flange", 10)
  util.add_ingredient("steam-turbine", "titanium-palladium-flange", 10)
  util.add_ingredient("rocket-silo", "titanium-palladium-flange", 100)
end
