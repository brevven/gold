local futil = require("util");
local util = require("data-util");

if mods.modmashsplintergold then
  util.multiply_recipe("gold-plate", 2)
  util.replace_ingredient("gold-plate", "gold-ore", "gold-ingot", 1)
  util.set_enabled("gold-plate", false)
  util.add_unlock("gold-processing", "gold-plate")


  util.set_enabled("gold-ore", false)
  util.set_hidden("gold-ore", true)

  for name, recipe in pairs(data.raw.recipe) do
    local amt = util.get_ingredient_amount(name, "gold-plate") 
    if amt == 0 then
      amt = util.get_ingredient_amount(name, "gold-cable") 
    end
    if amt > 0 then
      util.set_enabled(name, false)
      util.remove_prior_unlocks("gold-processing", name)
      util.add_unlock("gold-processing", name)
      if recipe.icons then
        for i, icon in pairs(recipe.icons) do
          if string.match(icon.icon, "gold%-ore") then
            icon.scale = (icon.scale or 1) / 2
          end
        end
      end
    end
  end

  -- alternate electronic circuit recipe that uses gold
  util.remove_raw("recipe", "electronic-circuit-with-gold")
  local ec = futil.table.deepcopy(data.raw.recipe["electronic-circuit"])
  ec.name = "electronic-circuit-with-gold"
  data:extend({ec})
  util.replace_ingredient("electronic-circuit-with-gold", "copper-cable", "gold-cable")
  util.set_icons("electronic-circuit-with-gold", {
    {
      icon = "__base__/graphics/icons/electronic-circuit.png",
      icon_size = 64, icon_mipmaps = 4
    },
    {
      icon = "__modmashsplintergold__/graphics/icons/gold-cable.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {8,-8}
    },
  })
end
