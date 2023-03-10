require("stacking")
require("prototypes/electronic-circuit-final")
require("modules")
-- require("tin-recipe-final-5d")
-- require("tin-recipe-final-rrr")

local util = require("data-util");

if mods["space-exploration"] then 
  util.remove_product("se-core-fragment-omni", "gold-ore")
  util.remove_product("se-core-fragment-omni", "rich-copper-ore")
  -- util.add_to_product("se-core-fragment-omni", "salt", -5)
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
