local wezterm = require("wezterm")
local windows = {}

function windows.apply_to_config(config)
  local image_dir = wezterm.home_dir .. "/wezterm-images"
  config.window_background_image = image_dir .. "/background.png"
  config.window_background_image_hsb = {
    -- Darken the background image by reducing it to 1/3rd
    brightness = 0.02,
    hue = 1.0,
    saturation = 0.8,
  }
  config.window_background_opacity = 1.0
  config.inactive_pane_hsb = {
    hue = 0.5,
    saturation = 0.9,
    brightness = 0.3,
  }

  config.window_frame = {
    font = wezterm.font({ family = "Roboto", weight = "Bold" }),
    font_size = 13.0,
  }

  config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }
  config.adjust_window_size_when_changing_font_size = false
end

return windows
