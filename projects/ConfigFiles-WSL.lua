local M = {}

function M.startup(wezterm, workspace_name)
  local mux = wezterm.mux

  local first_tab, first_pane, proj_window = mux.spawn_window({
    workspace = workspace_name,
    args = { "wsl" },
  })

  first_tab:set_title("dotfiles")
  first_pane:send_text('cd "$DOTFILES"\r')

  local second_tab, second_pane, _ = proj_window:spawn_tab({
    args = { "wsl" },
  })

  second_tab:set_title("Nvim Config")
  second_pane:send_text('cd "$DOTFILES/nvim/.config/nvim"\r')

  local third_tab, third_pane, _ = proj_window:spawn_tab({
    args = { "wsl" },
  })

  third_tab:set_title("WezTerm Config")
  third_pane:send_text('cd "$DOTFILES/wezterm/.config/wezterm"\r')

  mux.set_active_workspace(workspace_name)
end

return M
