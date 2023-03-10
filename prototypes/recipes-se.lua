local util = require("data-util");

if util.se6() then
  data:extend({{
    type = "item-subgroup",
    name = "gold",
    group = "resources",
    order = "a-h-z-a",
  }})
  util.set_item_subgroup("gold-ore", "gold")
  util.set_item_subgroup("gold-ingot", "gold")
  se_delivery_cannon_recipes["gold-ore"] = {name="gold-ore"}
  se_delivery_cannon_recipes["gold-ingot"] = {name="gold-ingot"}
  util.se_matter({ore="gold-ore", energy_required=5, quant_out=5, stream_out=30})
  if util.me.silver() then
    data:extend({{
      type = "item-subgroup",
      name = "silver",
      group = "resources",
      order = "a-h-z-a",
    }})
    util.set_item_subgroup("silver-ore", "silver")
    util.set_item_subgroup("silver-plate", "silver")
    util.set_item_subgroup("silver-brazing-alloy", "silver")
    se_delivery_cannon_recipes["silver-ore"] = {name="silver-ore"}
    se_delivery_cannon_recipes["silver-plate"] = {name="silver-plate"}
    util.se_matter({ore="silver-ore", energy_required=5, quant_out=5, stream_out=30})
  end
  if util.me.platinum() then
    util.set_item_subgroup("platinum-powder", "gold")
    util.set_item_subgroup("platinum-ingot", "gold")
    se_delivery_cannon_recipes["platinum-ingot"] = {name="platinum-ingot"}
    se_delivery_cannon_recipes["platinum-powder"] = {name="platinum-powder"}
  end
  if util.me.platinum() then
    util.set_item_subgroup("palladium-powder", "gold")
    util.set_item_subgroup("palladium-ingot", "gold")
    se_delivery_cannon_recipes["palladium-ingot"] = {name="palladium-ingot"}
    se_delivery_cannon_recipes["palladium-powder"] = {name="palladium-powder"}
  end
end
