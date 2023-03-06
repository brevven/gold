local futil = require("util");
local util = require("data-util");

if util.me.catalysis() then
local recipes_to_update = {
  "heavy-oil-cracking",
  "light-oil-cracking",
  "solid-fuel-from-heavy-oil",
  "solid-fuel-from-light-oil",
  "solid-fuel-from-petroleum-gas",
  "phenol-from-oil",
}


local prefix = "catalyzed-"
for i, recipe_name in pairs(recipes_to_update) do
  -- create a copy of the recipe
  local r = futil.table.deepcopy(data.raw.recipe[recipe_name])
  new_name = prefix..r.name
  r.name = new_name

  if string.find(new_name, "cracking") then
    r.localised_name = {"", {"recipe-name.catalyzed"}, " ", {"recipe-name."..recipe_name}}
  else
    local s
    s, _ = string.find(recipe_name, "-from-") -- bit of a hack
    r.main_product = string.sub(recipe_name, 1, s-1)
  end

  -- copy should require 1 catalyst, and have 90% chance to return 1 catalyst
  data:extend({r})
  util.add_ingredient(new_name, "ptpd-catalyst", 1, {force=true})
  util.add_product(new_name, {type="item", name="ptpd-catalyst", amount=1,
                          catalyst_amount=1, probability=.9}, {force=true})
  util.add_icon(new_name, {icon="__bzgold__/graphics/icons/ptpd-catalyst.png",
                       icon_size=128, scale=0.124, shift={8,-8}})

  -- halve the time of the copy recipe
  util.multiply_time(new_name, 0.5, {force=true})

  -- copy should be unlocked by "catalysis"
  util.add_unlock("catalysis", new_name)
  
  -- add 10 to the input oil ingredients of the basic recipe
  for j, fluid in pairs({"heavy-oil", "light-oil", "petroleum-gas"}) do
    util.add_to_ingredient(recipe_name, fluid, 10)
  end
end
end
