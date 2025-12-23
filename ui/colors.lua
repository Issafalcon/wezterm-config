local colors = {}
local wezterm = require("wezterm")

function colors.apply_to_config(config)
  config.color_scheme = "Catppuccin Mocha"
  config.colors = {
    -- tab_bar = {
    --   background = scheme.background,
    --   new_tab = { bg_color = "#2e3440", fg_color = scheme.ansi[8], intensity = "Bold" },
    --   new_tab_hover = { bg_color = scheme.ansi[1], fg_color = scheme.brights[8], intensity = "Bold" },
    --   -- format-tab-title
    --   -- active_tab = { bg_color = "#121212", fg_color = "#FCE8C3" },
    --   -- inactive_tab = { bg_color = scheme.background, fg_color = "#FCE8C3" },
    --   -- inactive_tab_hover = { bg_color = scheme.ansi[1], fg_color = "#FCE8C3" },
    -- },
  }
end

return colors
