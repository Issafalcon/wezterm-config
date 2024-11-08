local M = {}

function M.startup(wezterm, workspace_name, run_project)
  local mux = wezterm.mux

  local first_tab, first_pane, proj_window = mux.spawn_window({
    workspace = workspace_name,
    args = { "wsl" },
  })

  first_tab:set_title("wcc-env-config")
  first_pane:send_text('if [ ! -d "${PROJECTS}"/wcc-env-config ]; then\r')
  first_pane:send_text('git clone git@github.com:WatersConnectCloud/wcc-env-config.git "${PROJECTS}"/wcc-env-config\r')
  first_pane:send_text("fi\r")

  first_pane:send_text('cd "$PROJECTS/wcc-env-config"\r')
  first_pane:send_text("clear\r")
  first_pane:send_text("nvim\r")

  local second_tab, second_pane, _ = proj_window:spawn_tab({
    args = { "wsl" },
  })

  second_tab:set_title("wcc-tfg-app-deployments")
  second_pane:send_text('if [ ! -d "${PROJECTS}"/wcc-tfg-app-deployments ]; then\r')
  second_pane:send_text(
    'git clone git@github.com:WatersConnectCloud/wcc-tfg-app-deployments.git "${PROJECTS}"/wcc-tfg-app-deployments\r'
  )
  second_pane:send_text("fi\r")
  second_pane:send_text('cd "$PROJECTS/wcc-tfg-app-deployments"\r')
  second_pane:send_text("clear\r")
  second_pane:send_text("nvim\r")

  local term_tab, term_pane, _ = proj_window:spawn_tab({
    args = { "wsl" },
  })

  term_tab:set_title("Terminals")
  term_pane:send_text('cd "$PROJECTS/wcc-env-config"\r')

  mux.set_active_workspace(workspace_name)
end

return M
