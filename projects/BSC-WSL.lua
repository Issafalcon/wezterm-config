local M = {}

function M.startup(wezterm, workspace_name)
  local mux = wezterm.mux
  local project_dir = wezterm.home_dir .. "/repos"

  -- Neotest-dotnet
  local bsc_wsl_tab, bsc_pane, proj_window = mux.spawn_window({
    workspace = workspace_name,
    cwd = project_dir,
    args = {
      "wsl",
    },
  })

  bsc_wsl_tab:set_title("BSC")
  bsc_pane:send_text("tmux_start_bsc.sh\r")

  mux.set_active_workspace(workspace_name)
end
return M
