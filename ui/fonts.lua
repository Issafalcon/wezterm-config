local wezterm = require("wezterm")
local fonts = {}

function fonts.apply_to_config(config)
  config.font = wezterm.font({
    family = "JetBrains Mono",
    weight = "DemiBold",
  })

  config.font_size = 12.5
end

return fonts
