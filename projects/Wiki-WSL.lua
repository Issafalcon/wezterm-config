local M = {}

function M.startup(wezterm, workspace_name)
	local mux = wezterm.mux
	local project_dir = wezterm.home_dir .. "/repos"

	local wsl_domains = wezterm.default_wsl_domains()
	local default_wsl = wsl_domains[1]

	local wsl_tab, wsl_pane, proj_window = mux.spawn_window({
		workspace = workspace_name,
		cwd = project_dir,
		args = { "wsl" },
	})

	wsl_tab:set_title("WSL - Tmux")
	wsl_pane:send_text("tmux_start_wiki.sh\r")

	mux.set_active_workspace(workspace_name)
end

return M
