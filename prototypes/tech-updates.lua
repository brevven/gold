local util = require("data-util")

util.add_prerequisite("advanced-electronics", "silver-processing")
util.add_prerequisite("solar-energy", "silver-processing")
util.add_prerequisite("oil-processing", "silver-processing")

util.add_prerequisite("gas-extraction", "silver-processing")

util.add_prerequisite("advanced-electronics-2", "gold-processing")
util.remove_prerequisite("advanced-electronics-2", "chemical-science-pack")
util.add_prerequisite("advanced-electronics-2", "temperature-regulation")
util.add_prerequisite("advanced-electronics-2", "advanced-capacitors")
util.add_prerequisite("nuclear-power", "palladium-processing")

if mods["aai-industry"] then
  util.add_prerequisite("industrial-furnace", "temperature-regulation")
else
  util.add_prerequisite("advanced-material-processing-2", "temperature-regulation")
end

util.add_unlock("advanced-electronics-2", "cpu")
util.add_unlock("advanced-electronics-2", "mainboard")

util.add_prerequisite("coal-liquefaction", "catalysis")
util.remove_prerequisite("coal-liquefaction", "production-science-pack")
util.remove_prerequisite("coal-liquefaction", "advanced-oil-processing")
