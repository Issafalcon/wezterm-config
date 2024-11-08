local M = {}

function M.startup(wezterm, workspace_name)
  local mux = wezterm.mux

  local first_tab, first_pane, proj_window = mux.spawn_window({
    workspace = workspace_name,
    args = { "wsl" },
  })

  first_tab:set_title("Obsidian")
  first_pane:send_text('if [ ! -d "${PROJECTS}"/obsidian-notes ]; then\r')
  first_pane:send_text('git clone https://github.com/Issafalcon/obsidian-notes.git "${PROJECTS}"/obsidian-notes\r')
  first_pane:send_text("fi\r")

  first_pane:send_text('cd "$PROJECTS/obsidian-notes"\r')
  first_pane:send_text("clear\r")

  -- Terminal tab
  local second_tab, second_pane, _ = proj_window:spawn_tab({
    args = { "wsl" },
  })

  second_tab:set_title("Terminals")
  second_pane:send_text('cd "$PROJECTS/obsidian-notes"\r')

  local lower_split = second_pane:split({
    direction = "Bottom",
    size = 0.05,
    args = { "wsl" },
  })

  lower_split:send_text("obsidian\r")

  mux.set_active_workspace(workspace_name)
end

return M
