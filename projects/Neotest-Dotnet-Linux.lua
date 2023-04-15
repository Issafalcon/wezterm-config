local M = {}

function M.startup(wezterm, workspace_name)
  local mux = wezterm.mux
  local project_dir = wezterm.home_dir .. "/repos"

  -- Neotext-dotnet (Neovim Pane)
  local first_tab, first_pane, proj_window = mux.spawn_window({
    workspace = workspace_name,
    cwd = project_dir,
  })

  first_tab:set_title("neotest-dotnet")
  first_pane:send_text("cd neotest-dotnet\r")
  first_pane:send_text("nvim\r")

  -- Second Window (learning-dotnet repo) with sample unit tests
  local second_tab, second_pane, second_window = mux.spawn_window({
    workspace = workspace_name,
    cwd = project_dir,
  })

  second_tab:set_title("learning-dotnet")
  second_pane:send_text("cd learning-dotnet\r")

  second_pane:split({
    direction = "Bottom",
    size = 0.05,
  })

  mux.set_active_workspace(workspace_name)
end
return M
