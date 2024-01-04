local M = {}

function M.startup(wezterm, workspace_name)
  local mux = wezterm.mux
  local project_dir = wezterm.home_dir .. "/repos"

  -- Check if ~/repos/wiki-md exists, and if not, clone it
  local wiki_md_dir = project_dir .. "/wiki-md"

  local wiki_md_exists = wezterm.run_child_process({
    "test",
    "-d",
    wiki_md_dir,
  })

  if wiki_md_exists ~= 0 then
    wezterm.run_child_process({
      "git",
      "clone",
      "https://github.com/Issafalcon/wiki-md.git",
      wiki_md_dir,
    })
  end

  -- Obsidian Wiki repo tab (Neovim)
  local first_tab, first_pane, proj_window = mux.spawn_window({
    workspace = workspace_name,
    cwd = wiki_md_dir,
  })

  first_tab:set_title("Obsidian")
  first_pane:send_text("nvim\r")

  -- Terminal tab
  local second_tab, second_pane, _ = proj_window:spawn_tab({
    cwd = project_dir,
  })

  second_tab:set_title("Terminals")
  second_pane:send_text("cd wiki\r")

  -- Wiki repo tab (Neovim)
  local third_tab, third_pane, _ = proj_window.spawn_window({
    workspace = workspace_name,
    cwd = project_dir .. "/wiki",
  })

  third_tab:set_title("Wiki")
  third_pane:send_text("nvim\r")

  mux.set_active_workspace(workspace_name)
end

return M
