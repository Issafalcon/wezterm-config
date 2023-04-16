local M = {}

function M.startup(wezterm, workspace_name)
  local mux = wezterm.mux
  local project_dir = wezterm.home_dir .. "/repos"

  -- Neotest-dotnet
  local neotest_dotnet_tab, neotest_dotnet_pane, proj_window = mux.spawn_window({
    workspace = workspace_name,
    cwd = project_dir,
    args = {
      "wsl",
    },
  })

  neotest_dotnet_tab:set_title("neotest-dotnet")
  neotest_dotnet_pane:send_text("tmux_start_neotest_dotnet.sh\r")

  -- Learning-dotnet (2nd window)
  local learning_dotnet_tab, learning_dotnet_pane, proj_window = mux.spawn_window({
    workspace = workspace_name,
    cwd = project_dir,
    args = {
      "wsl",
    },
  })

  learning_dotnet_tab:set_title("learning-dotnet")
  learning_dotnet_pane:send_text("tmux_start_learning_dotnet.sh\r")

  mux.set_active_workspace(workspace_name)
end
return M
