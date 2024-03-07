local M = {}

function M.startup(wezterm, workspace_name)
  local mux = wezterm.mux
  local project_dir = wezterm.home_dir .. "/repos"

  local scrimmage_api_dir = project_dir .. "/scrimmage-api"
  local scrimmage_web_dir = project_dir .. "/scrimmage-web"

  local scrimmage_api_exists = wezterm.run_child_process({
    "test",
    "-d",
    scrimmage_api_dir,
  })

  if scrimmage_api_exists ~= 0 then
    wezterm.run_child_process({
      "git",
      "clone",
      "https://github.com/Issafalcon/scrimmage-api.git",
      scrimmage_api_dir,
    })
  end

  local scrimmage_web_exists = wezterm.run_child_process({
    "test",
    "-d",
    scrimmage_web_dir,
  })

  if scrimmage_web_exists ~= 0 then
    wezterm.run_child_process({
      "git",
      "clone",
      "https://github.com/Issafalcon/scrimmage-web.git",
      scrimmage_web_dir,
    })
  end

  -- Scrimmage API tab (Neovim)
  local first_tab, first_pane, proj_window = mux.spawn_window({
    workspace = workspace_name,
    cwd = scrimmage_api_dir,
  })

  first_tab:set_title("Scrimmage API")
  first_pane:send_text("nvim\r")

  -- Scrimmage Web tab (Neovim)
  local second_tab, second_pane, _ = proj_window:spawn_tab({
    workspace = workspace_name,
    cwd = scrimmage_web_dir,
  })

  second_tab:set_title("Scrimmage Web")
  second_pane:send_text("nvim\r")

  -- Terminal tab
  local third_tab, third_pane, _ = proj_window:spawn_tab({
    cwd = project_dir,
  })

  third_tab:set_title("Terminals")

  third_pane:split({
    direction = "Bottom",
    size = 0.05,
  })

  mux.set_active_workspace(workspace_name)
end

return M
