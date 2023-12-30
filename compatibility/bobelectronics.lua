local util = require("data-util")

if mods.bobelectronics or mods.MDbobelectronics then
  util.replace_ingredient("advanced-processing-unit", "processing-electronics", "cpu", 4)
  util.remove_recipe_effect("advanced-electronics-3", "processing-electronics")
  util.remove_raw("recipe", "processing-electronics")
  util.remove_raw("item", "processing-electronics")

  for j, module in pairs(data.raw.module) do
    if module.effect then
      for effect_name, effect in pairs(module.effect) do
        if effect_name == "productivity" and effect.bonus > 0 and module.limitation and #module.limitation > 0 then
          for k = #module.limitation, 1, -1 do
            if module.limitation[k] == "processing-electronics" then
              table.remove(module.limitation, k)
            end
          end
        end
      end
    end
  end
end
