local wezterm = require("wezterm")
local menus = require("menus")
local behaviour = require("behaviour")
local ui = require("ui")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Custom Config
ui.apply_to_config(config)
behaviour.apply_to_config(config)
menus.apply_to_config(config)

return config
