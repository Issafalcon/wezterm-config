local M = {}

function M.startup(wezterm, workspace_name)
	local mux = wezterm.mux

	local wsl_domains = wezterm.default_wsl_domains()
	local default_wsl = wsl_domains[1]

	local wsl_tab, wsl_pane, proj_window = mux.spawn_window({
		workspace = workspace_name,
		domain = { DomainName = default_wsl.name },
		args = {
			"tmux",
		},
	})

	wsl_tab:set_title("WSL - Tmux")

	mux.set_active_workspace("WSL")
end

return M
