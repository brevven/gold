local util = require("data-util");

if mods["248k"] then
  local au2 = "fu_materials_gold_ingot"

  -- Swap out all 248k gold ingot for BZ gold ingot
  for i, recipe in pairs(data.raw.recipe) do
    util.replace_ingredient(recipe.name, au2, "gold-ingot")
    util.replace_product(recipe.name, au2, "gold-ingot")
  end

  if mods.LootingRemnants and data.raw.recipe.gr_white_hole_cycle_fu_materials_gold_recipe~=nil then
    data.raw.recipe.gr_white_hole_cycle_fu_materials_gold_recipe.exception_mods = {"Deconstruction", "LootingRemnants"}
  end

  -- Remove 248k gold ingot
  util.remove_raw("item", au2)
end
