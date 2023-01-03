data:extend({
  {
		type = "string-setting",
		name = "bzgold-recipe-bypass",
		setting_type = "startup",
		default_value = "",
    allow_blank = true,
    order = "a",
	},
  {
		type = "bool-setting",
		name = "bzgold-list",
		setting_type = "startup",
    default_value = false,
    order = "b",
	},
  {
    type = "bool-setting",
    name = "bzgold-silver",
		setting_type = "startup",
    default_value = true,
    order = "c1",
  },
  {
    type = "bool-setting",
    name = "bzgold-catalysis",
		setting_type = "startup",
    default_value = true,
    order = "c2",
  },
  {
		type = "string-setting",
		name = "bzgold-more-intermediates",
		setting_type = "startup",
		default_value = "yes",
    allowed_values = {"yes", "no"},
    order = "d",
	},
})
