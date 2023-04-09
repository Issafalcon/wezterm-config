local M = {}

function M.startup(wezterm)
	local mux = wezterm.mux

	local wsl_tab, wsl_pane, proj_window = mux.spawn_window({
		workspace = "WSL",
		args = {
			"wsl",
		},
	})

	wsl_tab:set_title("WSL - Tmux")

	wsl_pane:send_text("tmux\r")
	mux.set_active_workspace("WSL")
end

return M
