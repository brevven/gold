local me = {}

me.name = "bzgold"
me.list = {}
me.recipes = {
  "electronic-circuit-silver", "silver-plate", "silver-wire",
  "gold-ingot", "platinum-ingot", "palladium-ingot",
  "temperature-sensor", "mlcc", "silver-brazing-alloy", "titanium-palladium-flange",
  --k2
  "enriched-silver", "enriched-gold", "enriched-silver-plate", "enriched-gold-ingot",
  --se
  "molten-silver", "molten-gold",
}

function me.alchemy()
  return me.get_setting("bzgold-alchemy")
end

function me.core_mining()
  return me.get_setting("bzgold-se-core-mining")
end

function me.byproduct()
  return me.get_setting("bzgold-byproduct") and not me.get_setting("bz-no-byproduct")
end

function me.lead_byproduct()
  return me.get_setting("bzlead-byproduct") and not me.get_setting("bz-no-byproduct")
end

function me.silver() 
  if me.get_setting("bz-all-intermediates") then return true end
  return me.get_setting("bzgold-silver")
end

function me.palladium() 
  if me.get_setting("bz-all-intermediates") then return true end
  return me.get_setting("bzgold-palladium")
end

function me.platinum() 
  if me.get_setting("bz-all-intermediates") then return true end
  return me.get_setting("bzgold-platinum")
end

function me.catalysis() 
  return me.get_setting("bzgold-catalysis")
end

function me.get_setting(name)
  if settings.startup[name] == nil then
    return nil
  end
  return settings.startup[name].value
end

me.bypass = {}
if me.get_setting(me.name.."-recipe-bypass") then 
  for recipe in string.gmatch(me.get_setting(me.name.."-recipe-bypass"), '[^",%s]+') do
    me.bypass[recipe] = true
  end
end

function me.add_modified(name) 
  if me.get_setting(me.name.."-list") then 
    table.insert(me.list, name)
  end
end


return me
