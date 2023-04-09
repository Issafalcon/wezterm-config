local M = {}

function M.startup(wezterm)
	local mux = wezterm.mux

	local wsl_tab, wsl_pane, proj_window = mux.spawn_window({
		workspace = "WSL",
		args = {
			"wsl",
		},
	})

	wsl_tab:set_title("WSL")

	mux.set_active_workspace("WSL")
end

return M
