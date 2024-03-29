local util = require("data-util");

if mods["crafting-efficiency-2"] then

  local eff_data = {
  }

  for i, recipe in pairs(util.me.recipes) do
    -- add remaining recipes with direct items to find the icons
    if data.raw.recipe[recipe] and (data.raw.item[recipe] or data.raw.fluid[recipe])
    and not eff_data[recipe] and 
    (data.raw.recipe[recipe].main_product or util.get_result_count(recipe) == 1) then
      local research_level = 6
      if data.raw.recipe[recipe].enabled then
        research_level = 1
      else
        for tech, tbl in pairs(data.raw.technology) do
          for _, effect in pairs(tbl.effects or {}) do
            if effect.type == "unlock-recipe" and effect.recipe == recipe then
              research_level = math.min(#tbl.unit.ingredients, research_level)
            end
          end
        end
      end
      eff_data[recipe] = {
        max = 15,
        icon = data.raw.item[recipe] and data.raw.item[recipe].icon or data.raw.fluid[recipe].icon,
        crafting = { efficiency = 10 },
        research = { level = research_level },
      }
    end
  end
  for recipe, d in pairs(eff_data) do 
    log("Adding "..recipe.." crafting efficiency")
    d.name = recipe:gsub("^%l", string.upper).." efficiency"
    CE_Add_Recipe(d, recipe)
  end
end
