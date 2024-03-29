data:extend({
  {
		type = "string-setting",
		name = "bzgold-recipe-bypass",
		setting_type = "startup",
		default_value = "",
    allow_blank = true,
    order = "a1",
	},
  {
		type = "bool-setting",
		name = "bzgold-list",
		setting_type = "startup",
    default_value = false,
    order = "a2",
	},
  {
		type = "bool-setting",
		name = "bzgold-byproduct",
		setting_type = "startup",
    default_value = true,
    order = "a3",
	},
  {
    type = "bool-setting",
    name = "bzgold-palladium",
		setting_type = "startup",
    default_value = true,
    order = "c1",
  },
  {
    type = "bool-setting",
    name = "bzgold-platinum",
		setting_type = "startup",
    default_value = true,
    order = "c2",
  },
  {
    type = "bool-setting",
    name = "bzgold-silver",
		setting_type = "startup",
    default_value = true,
    order = "c3",
  },
  {
    type = "bool-setting",
    name = "bzgold-catalysis",
		setting_type = "startup",
    default_value = true,
    order = "d",
  },
})
if mods.bzlead then
  data:extend({
    {
      type = "bool-setting",
      name = "bzgold-alchemy",
      setting_type = "startup",
      default_value = false,
      order = "e",
    },
  })
end

if mods["space-exploration"] then
  data:extend({
    {
      type = "double-setting",
      name = "bzgold-se-core-mining",
      setting_type = "startup",
      default_value = 0.0,
      minimum_value = 0.0,
      maximum_value = 1.0,
      order = "d2",
    },
  })
end
