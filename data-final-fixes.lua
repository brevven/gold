require("stacking")
require("prototypes/electronic-circuit-final")
require("modules")
require("prototypes/oil-updates")
require("compatibility/modmashsplintergold")
require("compatibility/248k-final")
-- require("tin-recipe-final-5d")
-- require("tin-recipe-final-rrr")

local util = require("data-util");

if mods["space-exploration"] then 
  util.remove_product("se-core-fragment-omni", "gold-ore")
  util.remove_product("se-core-fragment-omni", "rich-copper-ore")
  if util.me.core_mining() > 0.0 then
    util.add_product("se-core-fragment-omni", {type="item", name="gold-ore", amount=1, probability = util.me.core_mining()})
    util.add_product("se-core-fragment-omni", {type="item", name="rich-copper-ore", amount=2, probability = util.me.core_mining()})
  end


  -- Set main product for solid fuel
  util.set_main_product("catalyzed-solid-fuel-from-heavy-oil", "solid-fuel")
  util.set_main_product("catalyzed-solid-fuel-from-light-oil", "solid-fuel")
  util.set_main_product("catalyzed-solid-fuel-from-petroleum-gas", "solid-fuel")
end

-- these need to be in final fixes for one reason or another
util.replace_ingredient("textplate-small-gold", "sulfur", "gold-ingot")
util.replace_ingredient("textplate-large-gold", "sulfur", "gold-ingot")

-- If furnaces are treated as furnaces, we need 4 outputs
for i, entity in pairs(data.raw.furnace) do
  if entity.result_inventory_size ~= nil and entity.result_inventory_size < 4 and util.contains(entity.crafting_categories, "smelting") then
    entity.result_inventory_size = 4
  end
end

-- Must be last
util.create_list()
