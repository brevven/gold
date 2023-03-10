-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
  local util = require("data-util");
  local matter = require("__Krastorio2__/lib/public/data-stages/matter-util")

  data:extend(
      {
        {
          type = "technology",
          name = "gold-matter-processing",
          icons =
          {
            {
              icon = util.k2assets().."/technologies/matter-stone.png",
              icon_size = 256,
            },
            {
              icon = "__bzgold__/graphics/icons/gold-ore.png",
              icon_size = 128,
              scale = 1,
            }
          },
          prerequisites = {"kr-matter-processing"},
          unit =
          {
            count = 350,
            ingredients =
            {
              {"production-science-pack", 1},
              {"utility-science-pack", 1},
              {"matter-tech-card", 1}
            },
            time = 45
          }
        },
      })
  matter.createMatterRecipe({
    item_name = "gold-ore",
    minimum_conversion_quantity = 10,
    matter_value = 30,
    energy_required = 1,
    need_stabilizer = false,
    unlocked_by_technology = "gold-matter-processing"
  })

  if util.me.silver() then
    data:extend(
        {
          {
            type = "technology",
            name = "silver-matter-processing",
            icons =
            {
              {
                icon = util.k2assets().."/technologies/matter-stone.png",
                icon_size = 256,
              },
              {
                icon = "__bzgold__/graphics/icons/silver-ore.png",
                icon_size = 128,
                scale = 1,
              }
            },
            prerequisites = {"kr-matter-processing"},
            unit =
            {
              count = 350,
              ingredients =
              {
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"matter-tech-card", 1}
              },
              time = 45
            }
          },
        })
    matter.createMatterRecipe( {
      item_name = "silver-ore",
      minimum_conversion_quantity = 10,
      matter_value = 8,
      energy_required = 1,
      need_stabilizer = false,
      unlocked_by_technology = "silver-matter-processing"
    })
  end
end
