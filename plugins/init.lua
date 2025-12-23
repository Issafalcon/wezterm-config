local plugins = {}
local tabline = require("plugins.tabline")

function plugins.apply_to_config(config) tabline.apply_to_config(config) end

return plugins
