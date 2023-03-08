local futil = require("util");
local util = require("data-util")

-- SE
if util.me.silver() then
  util.replace_ingredient("se-nutrient-vat", "iron-plate", "silver-plate")
else
  util.multiply_recipe("se-nutrient-vat", 10)
  util.replace_ingredient("se-nutrient-vat", "iron-plate", "platinum-ingot")
  util.replace_ingredient("se-nutrient-vat", "iron-plate", "palladium-ingot")
end

if util.me.silver() then
  util.replace_some_ingredient("se-space-mirror", "steel-plate", 2, "silver-plate", 1)
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
util.add_ingredient("se-heavy-assembly", "silver-brazing-alloy", 1)
util.add_ingredient("se-space-assembling-machine", "silver-brazing-alloy", 2)

if util.me.silver() then
  util.add_ingredient("se-space-decontamination-facility", "silver-plate", 5)
  util.add_ingredient("se-space-decontamination-facility", "silver-brazing-alloy", 5)
else
  util.add_ingredient("se-space-decontamination-facility", "gold-ingot", 1)
end


util.multiply_recipe("se-bioscrubber", 10)
util.replace_some_ingredient("se-bioscrubber", "steel-plate", 10, "palladium-ingot", 1)
util.replace_some_ingredient("se-bioscrubber", "steel-plate", 10, "platinum-ingot", 1)
util.replace_some_ingredient("se-bioscrubber", "steel-plate", 10, "silver-plate", 10)

if util.me.platinum() then
  util.add_ingredient("se-bioelectrics-data", "platinum-ingot", 1)
  util.add_product("se-bioelectrics-data", {type=item, name="platinum-ingot", amount=1, probability=.9})
elseif util.me.palladium() then
  util.add_ingredient("se-bioelectrics-data", "palladium-ingot", 1)
  util.add_product("se-bioelectrics-data", {type=item, name="palladium-ingot", amount=1, probability=.9})
elseif util.me.silver() then
  util.add_ingredient("se-bioelectrics-data", "silver-plate", 1)
  util.add_product("se-bioelectrics-data", {type=item, name="silver-plate", amount=1, probability=.8})
else
  util.add_ingredient("se-bioelectrics-data", "gold-ingot", 1)
  util.add_product("se-bioelectrics-data", {type=item, name="gold-ingot", amount=1, probability=.8})
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
