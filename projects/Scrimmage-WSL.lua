local M = {}

function M.startup(wezterm, workspace_name, run_project)
  local mux = wezterm.mux

  local first_tab, first_pane, proj_window = mux.spawn_window({
    workspace = workspace_name,
    args = { "wsl" },
  })

  first_tab:set_title("Scrimmage-API")
  first_pane:send_text('if [ ! -d "${PROJECTS}"/scrimmage-api ]; then\r')
  first_pane:send_text('git clone https://github.com/Issafalcon/scrimmage-api.git "${PROJECTS}"/scrimmage-api\r')
  first_pane:send_text("fi\r")

  first_pane:send_text('cd "$PROJECTS/scrimmage-api"\r')
  first_pane:send_text("clear\r")
  first_pane:send_text("nvim\r")

  local second_tab, second_pane, _ = proj_window:spawn_tab({
    args = { "wsl" },
  })

  second_tab:set_title("Scrimmage-Web")
  second_pane:send_text('if [ ! -d "${PROJECTS}"/scrimmage-web ]; then\r')
  second_pane:send_text('git clone https://github.com/Issafalcon/scrimmage-web.git "${PROJECTS}"/scrimmage-web\r')
  second_pane:send_text("fi\r")
  second_pane:send_text('cd "$PROJECTS/scrimmage-web"\r')
  second_pane:send_text("clear\r")
  second_pane:send_text("nvim\r")

  local term_tab, term_pane, _ = proj_window:spawn_tab({
    args = { "wsl" },
  })

  term_tab:set_title("Terminals")
  term_pane:send_text('cd "$PROJECTS/scrimmage-api"\r')

  local lower_split = term_pane:split({
    direction = "Bottom",
    size = 0.05,
    args = { "wsl" },
  })

  lower_split:send_text('cd "$PROJECTS/scrimmage-web"\r')

  mux.set_active_workspace(workspace_name)
end

return M
