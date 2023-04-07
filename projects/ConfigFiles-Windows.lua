local M = {}

function M.startup(wezterm)
	local mux = wezterm.mux
	local project_dir = wezterm.home_dir .. "/repos"
	print(project_dir)

	local nvim_config_tab, nvim_pane, proj_window = mux.spawn_window({
		workspace = "Config Files",
		cwd = project_dir,
		args = {
			"pwsh",
		},
	})

	nvim_config_tab:set_title("nvim-config")

	local windows_config_tab, win_nvim_pane, _ = proj_window:spawn_tab({
		args = {
			"pwsh",
		},
	})

	windows_config_tab:set_title("windows-config")

	local wezterm_config_tab, wez_nvim_pane, _ = proj_window:spawn_tab({
		args = {
			"pwsh",
		},
	})

	wezterm_config_tab:set_title("wezterm-config")
	nvim_pane:send_text("cd nvim-config\r")
	nvim_pane:send_text("nvim +PluginDev\r")
	win_nvim_pane:send_text("cd windows-config\r")
	win_nvim_pane:send_text("nvim\r")
	wez_nvim_pane:send_text("cd wezterm-config\r")
	wez_nvim_pane:send_text("nvim\r")

	mux.set_active_workspace("Config Files")
end

return M
