local wezterm = require("wezterm")
local keybindings = require("behaviour.keybindings")

local behaviour = {}

function behaviour.apply_to_config(config)
	-- code
	if wezterm.target_triple == "x86_64-pc-windows-msvc" then
		config.default_prog = { "pwsh" }
	else
		config.default_prog = { "zsh" }
	end

	-- Cross platform config
	config.enable_csi_u_key_encoding = true
	config.selection_word_boundary = " \t\n{}[]()\"'`,;:│=&!%"
	config.enable_scroll_bar = true
	config.automatically_reload_config = false

	require("behaviour.eventhandlers")
	keybindings.apply_to_config(config)
end

return behaviour
