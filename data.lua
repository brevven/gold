require("prototypes/gold-ore")
require("prototypes/gold")
require("prototypes/silver")
require("prototypes/platinum")
require("prototypes/palladium")
require("prototypes/rich-copper")
require("prototypes/temperature-sensor")
require("prototypes/mlcc")
require("prototypes/cpu")
require("prototypes/mainboard")
require("prototypes/catalyst")
require("prototypes/recipes-se")
require("cables")
require("prototypes/enriched-silver")
require("prototypes/enriched-gold")
require("prototypes/pyroflux-gold")
require("prototypes/pyroflux-silver")

local util = require("data-util");

if util.se6() then
  -- se_delivery_cannon_recipes["salt"] = {name="salt"}
end

-- Must be last
util.create_list()
