local M = {}

function M.startup(wezterm, workspace_name)
  local mux = wezterm.mux
  local project_dir = wezterm.home_dir .. "/repos"

  local wsl_tab, wsl_pane, proj_window = mux.spawn_window({
    workspace = workspace_name,
    cwd = project_dir,
    args = { "wsl" },
  })

  wsl_tab:set_title("WSL - Config")
  wsl_pane:send_text("tmux_start_dotfiles.sh\r")

  mux.set_active_workspace(workspace_name)
end

return M
