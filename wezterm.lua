local wezterm = require("wezterm")
local colors = require("colors")
local fonts = require("fonts")
local windows = require("windows")
local launchmenu = require("launchmenu")
local keybindings = require("keybindings")
require("eventhandlers")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Custom Config
config.default_prog = { "pwsh" }
config.use_fancy_tab_bar = false
config.tab_max_width = 24
config.enable_csi_u_key_encoding = true
config.selection_word_boundary = " \t\n{}[]()\"'`,;:│=&!%"
config.enable_scroll_bar = true
config.automatically_reload_config = false

colors.apply_to_config(config)
fonts.apply_to_config(config)
windows.apply_to_config(config)
launchmenu.apply_to_config(config)
keybindings.apply_to_config(config)

return config
