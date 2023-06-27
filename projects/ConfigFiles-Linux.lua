local M = {}

function M.startup(wezterm, workspace_name)
  local mux = wezterm.mux
  local project_dir = wezterm.home_dir

  -- Dotfiles tab
  local first_config_tab, first_pane, proj_window = mux.spawn_window({
    workspace = workspace_name,
    cwd = project_dir,
  })

  first_config_tab:set_title("dotfiles")
  first_pane:send_text("cd dotFiles\r")
  first_pane:send_text("nvim\r")

  -- Neovim config tab
  local second_tab, second_pane, _ = proj_window:spawn_tab({})

  second_tab:set_title("neovim-config")
  second_pane:send_text("cd dotFiles/nvim/.config/nvim\r")
  second_pane:send_text("nvim\r")

  -- WezTerm config tab
  local third_tab, third_pane, _ = proj_window:spawn_tab({})

  third_tab:set_title("wezterm-config")
  third_pane:send_text("cd dotFiles/wezterm/.config/wezterm\r")
  third_pane:send_text("nvim\r")

  mux.set_active_workspace(workspace_name)
end

return M
