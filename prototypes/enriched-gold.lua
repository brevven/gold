local util = require("data-util");

if mods.Krastorio2 then

local enrich_results = 
    util.me.silver() and {
      {type = "item",  name = "enriched-gold", amount = 5},
      {type = "item",  name = "enriched-silver", amount = 1},
      {type = "fluid", name = "dirty-water", amount = 25, catalyst_amount = 25}
    } or { 
      {type = "item",  name = "enriched-gold", amount = 6},
      {type = "fluid", name = "dirty-water", amount = 25, catalyst_amount = 25}
    }

data:extend({
  {
    type = "item",
    name = "enriched-gold",
    icon_size = 128,
    icon = "__bzgold__/graphics/icons/enriched-gold.png",
      -- pictures = {
      --   {filename="__bzgold__/graphics/icons/enriched-gold.png", size=64, scale=0.25},
      --   {filename="__bzgold__/graphics/icons/enriched-gold-2.png", size=64, scale=0.25},
      --   {filename="__bzgold__/graphics/icons/enriched-gold-3.png", size=64, scale=0.25},
      --   {filename="__bzgold__/graphics/icons/enriched-gold-4.png", size=64, scale=0.25},
      -- },
    subgroup = "raw-material",
    order = "e05-a[enriched-ores]-a1[enriched-gold]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "enriched-gold",
    main_product = "enriched-gold",
    icon = "__bzgold__/graphics/icons/enriched-gold.png",
    icon_size = 128,
    category = "chemistry",
    energy_required = 3,
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    allow_productivity = true,
	subgroup = "raw-material",
    ingredients =
    {
      {type = "fluid", name = "chlorine", amount = 15},
      {type = "fluid", name = "water", amount = 25, catalyst_amount = 25},
      {type = "item",  name = "gold-ore", amount = 9}
    },
    results = enrich_results,
    crafting_machine_tint =
    {
      primary = {r = 0.721, g = 0.525, b = 0.043, a = 0.000},
      secondary = {r = 0.200, g = 0.680, b = 0.300, a = 0.357},
      tertiary = {r = 0.690, g = 0.768, b = 0.870, a = 0.000}, 
      quaternary = {r = 0.0, g = 0.980, b = 0.603, a = 0.900}
    },
    order = "e03[enriched-gold]"
  },
  {
      type = "recipe",
      name = "enriched-gold-ingot",
      icons =
      {
        { icon = "__bzgold__/graphics/icons/gold-ingot.png", icon_size = 128, icon_mipmaps = 3, },
        { icon = "__bzgold__/graphics/icons/enriched-gold.png", icon_size = 128, scale=0.125, shift= {-8, -8}},
      },
      category = "smelting",
      energy_required = 8,
      enabled = false,
      always_show_made_in = true,
      always_show_products = true,
      allow_productivity = true,
      ingredients = 
      {
        {"enriched-gold", 20}
      },
      result = "gold-ingot",
      result_count = 10,
      order = "b[gold-ingot]-b[enriched-gold-ingot]"
  },	
	{
		type = "recipe",
		name = "dirty-water-filtration-gold",
		category = "fluid-filtration",
		icons =
		{
			{
				icon = data.raw.fluid["dirty-water"].icon,
				icon_size = data.raw.fluid["dirty-water"].icon_size
			},
			{
				icon = data.raw.item["gold-ore"].icon,
				icon_size =	data.raw.item["gold-ore"].icon_size,
				scale = 0.20 * (data.raw.fluid["dirty-water"].icon_size/data.raw.item["gold-ore"].icon_size),
				shift = {0, 4}
			}
		},
		icon_size = data.raw.fluid["dirty-water"].icon_size,
		energy_required = 2,
		enabled = false,
		allow_as_intermediate = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients =
		{
			{type = "fluid", name = "dirty-water", amount = 100, catalyst_amount = 100},
		},
		results =
		{
			{type = "fluid", name = "water", amount = 90, catalyst_amount = 90},
			{type = "item",  name = "stone", probability = 0.30, amount = 1},
			{type = "item",  name = "gold-ore", probability = 0.05, amount = 1}
		},
		crafting_machine_tint =
		{
			primary = {r = 0.60, g = 0.20, b = 0, a = 0.6},
			secondary = {r = 1.0, g = 0.843, b = 0.0, a = 0.9}
		},
		subgroup = "raw-material",
		order = "w013[dirty-water-filtration-gold]"
	}
}
)
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "enriched-gold" })
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "enriched-gold-ingot" })
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "dirty-water-filtration-gold" })


end
