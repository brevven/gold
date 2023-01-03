require("prototypes/gold")
require("prototypes/silver")
require("prototypes/cables")

local util = require("data-util");

if util.se6() then
  -- se_delivery_cannon_recipes["salt"] = {name="salt"}
end

-- Must be last
util.create_list()
