-- Deadlock stacking recipes

local util = require("data-util");

if deadlock then
  deadlock.add_stack("gold-ore", nil, "deadlock-stacking-3", 128)
  deadlock.add_stack("gold-ingot", nil, "deadlock-stacking-3", 128)
  if mods.Krastorio2 then
    deadlock.add_stack("enriched-gold", nil, "deadlock-stacking-3", 128)
  end
  if util.me.silver() then
    deadlock.add_stack("silver-ore", nil, "deadlock-stacking-1", 128)
    deadlock.add_stack("silver-plate", nil, "deadlock-stacking-1", 128)
    deadlock.add_stack("silver-brazing-alloy", nil, "deadlock-stacking-1", 128)
    if mods.Krastorio2 then
      deadlock.add_stack("enriched-silver", nil, "deadlock-stacking-3", 128)
    end
    if util.se6() then
      deadlock.add_stack("silver-ingot", nil, "deadlock-stacking-3", 128)
    end
  end
  if util.me.platinum() then
    deadlock.add_stack("platinum-ingot", nil, "deadlock-stacking-3", 128)
    deadlock.add_stack("platinum-powder", nil, "deadlock-stacking-3", 64)
    deadlock.add_stack("temperature-sensor", nil, "deadlock-stacking-3", 128) 
  end
  if util.me.platinum() then
    deadlock.add_stack("palladium-ingot", nil, "deadlock-stacking-3", 128)
    deadlock.add_stack("palladium-powder", nil, "deadlock-stacking-3", 64)
    deadlock.add_stack("mlcc", nil, "deadlock-stacking-3", 128) 
    if data.raw.item["titanium-palladium-flange"] then
      deadlock.add_stack("titanium-palladium-flange", nil, "deadlock-stacking-3", 128) 
    end
  end
end

-- Deadlock crating recipes
if deadlock_crating then
  deadlock_crating.add_crate("gold-ore", "deadlock-crating-3")
  deadlock_crating.add_crate("gold-ingot", "deadlock-crating-3")
  if mods.Krastorio2 then
    deadlock_crating.add_crate("enriched-gold", "deadlock-crating-3")
  end
  if util.me.silver() then
    deadlock_crating.add_crate("silver-ore", "deadlock-crating-1")
    deadlock_crating.add_crate("silver-plate", "deadlock-crating-1")
    deadlock_crating.add_crate("silver-brazing-alloy", "deadlock-crating-1")
    if mods.Krastorio2 then
      deadlock_crating.add_crate("enriched-silver", "deadlock-crating-3")
    end
    if util.se6() then
      deadlock_crating.add_crate("silver-ingot", "deadlock-crating-3")
    end
  end
  if util.me.platinum() then
    deadlock_crating.add_crate("platinum-ingot", "deadlock-crating-3")
    deadlock_crating.add_crate("platinum-powder", "deadlock-crating-3")
    deadlock_crating.add_crate("temperature-sensor", "deadlock-crating-3")
  end
  if util.me.platinum() then
    deadlock_crating.add_crate("palladium-ingot", "deadlock-crating-3")
    deadlock_crating.add_crate("palladium-powder", "deadlock-crating-3")
    deadlock_crating.add_crate("mlcc", "deadlock-crating-3")
    if data.raw.item["titanium-palladium-flange"] then
      deadlock_crating.add_crate("titanium-palladium-flange", "deadlock-crating-3")
    end
  end
end

