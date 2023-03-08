local futil = require("util");
local util = require("data-util");


-- alternate electronic circuit recipe that uses silver
local ec = futil.table.deepcopy(data.raw.recipe["electronic-circuit"])
ec.name = "electronic-circuit-silver"
data:extend({ec})
util.replace_ingredient("electronic-circuit-silver", "copper-cable", "silver-wire")
util.set_icons("electronic-circuit-silver", {
        {
          icon = "__base__/graphics/icons/electronic-circuit.png",
          icon_size = 64, icon_mipmaps = 4
        },
        {
          icon = "__bzgold__/graphics/icons/silver-wire.png",
          icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {8,-8}
        },
})
if util.check_unlock("electronics", "electronic-circuit") then
  util.add_unlock("electronics", "electronic-circuit-silver")
end
