-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
  local util = require("data-util");

  util.k2matter({
    k2matter = {
      item_name = "gold-ore",
      matter_value = 30,
      energy_required = 10,
      need_stabilizer = false,
      unlocked_by_technology = "gold-matter-processing",
    },
    k2baseicon = "stone",
    icon = {icon = "__bzgold__/graphics/icons/gold-ore.png", icon_size = 128, scale = 1}
  })

  util.k2matter({
    k2matter = {
      item_name = "silver-ore",
      matter_value = 8,
      energy_required = 5,
      need_stabilizer = false,
      unlocked_by_technology = "silver-matter-processing",
    },
    k2baseicon = "stone",
    icon = {icon = "__bzgold__/graphics/icons/silver-ore.png", icon_size = 128, scale = 1}
  })
end
