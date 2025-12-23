local fonts = require("ui.fonts")
local windows = require("ui.windows")
local ui = {}

function ui.apply_to_config(config)
  -- config.use_fancy_tab_bar = false
  config.tab_max_width = 24

  fonts.apply_to_config(config)
  windows.apply_to_config(config)
end

return ui
