local futil = require("util");
local util = require("data-util");


if util.me.silver() then
  if mods.bobelectronics then
    -- alternate electronic circuit recipe that uses silver
    local ec = futil.table.deepcopy(data.raw.recipe["basic-electronic-components"])
    ec.name = "basic-electronic-components-silver"
    data:extend({ec})
    util.set_enabled("basic-electronic-components-silver", false)
    util.replace_ingredient("basic-electronic-components-silver", "copper-cable", "silver-wire")
    util.add_icon("basic-electronic-components-silver", {
        icon = "__bzgold__/graphics/icons/silver-wire.png",
        icon_size = 64, icon_mipmaps = 4, scale = 0.3, shift = {-8,-8}
    })
    util.add_icon("basic-electronic-components", {
        icon = "__base__/graphics/icons/copper-cable.png",
        icon_size = 64, icon_mipmaps = 4, scale = 0.3, shift = {-8,-8}
    })
    util.add_unlock("electronics", "basic-electronic-components-silver")
  else
    -- alternate electronic circuit recipe that uses silver
    util.set_main_product("electronic-circuit", "electronic-circuit")
    local ec = futil.table.deepcopy(data.raw.recipe["electronic-circuit"])
    ec.name = "electronic-circuit-silver"
    data:extend({ec})
    util.set_enabled("electronic-circuit-silver", false)
    util.replace_ingredient("electronic-circuit-silver", "copper-cable", "silver-wire")
    util.add_icon("electronic-circuit-silver", {
      icon = "__bzgold__/graphics/icons/silver-wire.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.3, shift = {8,-8}
    })
    util.add_icon("electronic-circuit", {
      icon = "__base__/graphics/icons/copper-cable.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.3, shift = {8,-8}
    })
    if util.check_unlock("electronics", "electronic-circuit") then
      util.add_unlock("electronics", "electronic-circuit-silver")
    else
      util.add_unlock("silver-processing", "electronic-circuit-silver")
    end
end

