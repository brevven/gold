local futil = require("util");
local util = require("data-util")

if util.se6() then
  util.replace_ingredient("se-rocket-launch-pad", "processing-unit", "rocket-control-unit")
  util.replace_ingredient("se-space-assembling-machine", "processing-unit", "advanced-circuit", 8)
  util.replace_ingredient("space-science-pack", "processing-unit", "advanced-circuit", 5)
  util.replace_ingredient("se-meteor-defence", "processing-unit", "advanced-circuit", 200)
  util.replace_ingredient("se-energy-beam-defence", "processing-unit", "advanced-circuit", 200)
  util.replace_ingredient("se-space-decontamination-facility", "processing-unit", "advanced-circuit", 20)
  util.replace_ingredient("se-space-supercomputer-1", "processing-unit", "advanced-circuit", 200)
  util.replace_ingredient("se-space-science-lab", "processing-unit", "advanced-circuit", 100)

  util.remove_prerequisite("se-meteor-defence", "advanced-electronics-2")
  util.add_prerequisite("se-meteor-defence", "se-rocket-science-pack")


  if util.me.silver() then
    util.replace_ingredient("se-nutrient-vat", "iron-plate", "silver-plate")
  else
    util.multiply_recipe("se-nutrient-vat", 10)
    util.replace_ingredient("se-nutrient-vat", "iron-plate", "platinum-ingot")
    util.replace_ingredient("se-nutrient-vat", "iron-plate", "palladium-ingot")
  end

  if util.me.silver() then
    util.replace_ingredient("se-space-mirror", "steel-plate", "silver-plate", 6)
  elseif util.me.palladium() then
    util.multiply_recipe("se-space-mirror", 10)
    util.replace_some_ingredient("se-space-mirror", "steel-plate", 20, "platinum-ingot", 1)
  elseif util.me.platinum() then
    util.multiply_recipe("se-space-mirror", 10)
    util.replace_some_ingredient("se-space-mirror", "steel-plate", 20, "palladium-ingot", 1)
  end

  util.replace_ingredient("se-condenser-turbine", util.titanium_plate, "titanium-palladium-flange")
  util.add_ingredient("se-condenser-turbine", "titanium-palladium-flange", 10)
  util.add_ingredient("se-big-turbine", "titanium-palladium-flange", 50)
  util.add_ingredient("se-heavy-assembly", "silver-brazing-alloy", 4)
  util.add_ingredient("se-space-assembling-machine", "silver-brazing-alloy", 8)
  util.replace_ingredient("se-space-pipe", "copper-cable", "silver-brazing-alloy")

  util.add_ingredient("se-space-thermodynamics-laboratory", "temperature-sensor", 20)
  util.add_ingredient("se-space-space-hypercooler", "temperature-sensor", 20)
  util.add_ingredient("se-space-space-radiator", "temperature-sensor", 10)

  util.multiply_recipe("se-heavy-bearing", 5)
  util.replace_some_ingredient("se-heavy-bearing", "se-iridium-plate", 5, "gold-ingot", 1)

  if util.me.silver() then
    util.add_ingredient("se-space-decontamination-facility", "silver-plate", 5)
  end


  util.multiply_recipe("se-bioscrubber", 10)
  if util.me.palladium() then
    util.replace_some_ingredient("se-bioscrubber", "steel-plate", 10, "palladium-ingot", 2)
  elseif util.me.platinum() then
    util.replace_some_ingredient("se-bioscrubber", "steel-plate", 10, "platinum-ingot", 2)
  else
    util.replace_some_ingredient("se-bioscrubber", "steel-plate", 10, "silver-plate", 10)
  end

  if util.me.platinum() then
    util.add_ingredient("se-bioelectrics-data", "platinum-ingot", 1)
    util.add_product("se-bioelectrics-data", {type="item", name="platinum-ingot", amount=1, probability=.9})
  elseif util.me.palladium() then
    util.add_ingredient("se-bioelectrics-data", "palladium-ingot", 1)
    util.add_product("se-bioelectrics-data", {type="item", name="palladium-ingot", amount=1, probability=.9})
  elseif util.me.silver() then
    util.add_ingredient("se-bioelectrics-data", "silver-plate", 1)
    util.add_product("se-bioelectrics-data", {type="item", name="silver-plate", amount=1, probability=.8})
  else
    util.add_ingredient("se-bioelectrics-data", "gold-ingot", 1)
    util.add_product("se-bioelectrics-data", {type="item", name="gold-ingot", amount=1, probability=.8})
  end




  --------
  --TODO rebalance SE modules more completely

  util.replace_ingredient("effectivity-module-5", "se-holmium-cable", "platinum-ingot", 10)
  util.replace_ingredient("effectivity-module-5", "se-holmium-cable", "silver-plate")
  util.replace_ingredient("effectivity-module-5", "se-holmium-cable", "palladium-ingot", 10)
  util.replace_ingredient("effectivity-module-5", "se-holmium-cable", "gold-ingot", 10)

  util.replace_ingredient("speed-module-5", "se-heavy-girder", "gold-ingot", 10)
  util.replace_ingredient("speed-module-5", "se-heavy-girder", "palladium-ingot", 10)
  util.replace_ingredient("speed-module-5", "se-heavy-girder", "platinum-ingot", 10)
  util.replace_ingredient("speed-module-5", "se-heavy-girder", "silver-plate")



  -- SE data card
  local dc = futil.table.deepcopy(data.raw.recipe["se-empty-data"])
  dc.name = "se-empty-data-gold"
  data:extend({dc})
  util.replace_some_ingredient("se-empty-data-gold", "copper-plate", 4, "gold-ingot", 1)
  util.set_product_amount("se-empty-data-gold", "se-empty-data", 3)
  util.add_icon("se-empty-data-gold", {
    icon = "__bzgold__/graphics/icons/gold-ingot.png",
    icon_size = 128, scale = 0.20, shift = {8,-8}
  })
  util.add_unlock("se-space-data-card", "se-empty-data-gold")
end
