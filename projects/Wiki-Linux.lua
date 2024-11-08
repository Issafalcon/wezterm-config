local M = {}

function M.startup(wezterm, workspace_name)
  local mux = wezterm.mux
  local project_dir = wezterm.home_dir .. "/repos"

  -- Check if ~/repos/wiki-md exists, and if not, clone it
  local obsidian_vault_dir = project_dir .. "/obsidian-notes"

  local obsidian_vault_exists = wezterm.run_child_process({
    "test",
    "-d",
    obsidian_vault_dir,
  })

  if obsidian_vault_exists ~= 0 then
    wezterm.run_child_process({
      "git",
      "clone",
      "https://github.com/Issafalcon/obsidian-notes.git",
      obsidian_vault_dir,
    })
  end

  -- Obsidian Wiki repo tab (Neovim)
  local first_tab, _, proj_window = mux.spawn_window({
    workspace = workspace_name,
    cwd = obsidian_vault_dir,
  })

  first_tab:set_title("Obsidian")

  -- Terminal tab
  local third_tab, third_pane, _ = proj_window:spawn_tab({
    cwd = project_dir,
  })

  third_tab:set_title("Terminals")

  local lower_split = third_pane:split({
    direction = "Bottom",
    size = 0.05,
  })

  lower_split:send_text("obsidian\r")

  mux.set_active_workspace(workspace_name)
end

return M
