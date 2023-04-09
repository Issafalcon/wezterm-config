# wezterm-config

This is my wezterm config, setup with the aim to satisfy my main dev environment requirements:
- Used primarily in Windows and be able to seamlessly open / switch to other panes running WSL2
- Cross platform, so can be used on macOS or linux
- Has keybindings as closely matched to the equivalent operations in TMUX (which I still use for WSL2)
  - So I don't need to remember so many keybindings across multiplexers
- Has the ability to load a custom "Projects" menu so I can spin up common projects as Workspaces
  - Also has the capability to quickly close these workspaces
- Has a convenient UI with useful information about the environment / projects I'm working in

## Custom project setup

In the `menus` subfolder, a `projects.lua` file returns a custom `get_input_selector()` function.

Using the `InputSelector` command, and binding the custom projects `get_input_selector` command to the `<LEADER-e>`, allows a list of the available "Projects" to be loaded as items in the list. The projects are enabled by creating a `.lua` file in the following locations:
- The `projects` subfolder in this config repo (core projects I know I will always use and have pulled locally)
- The `$HOME/.config/wezterm-projects`

Each project file has a `startup()` function which is called when the corresponding project is selected from the `InputSelector` list. This will, in turn, run wezterm commands to create windows, panes and tabs with associated commands, in order to set up each workspace.
