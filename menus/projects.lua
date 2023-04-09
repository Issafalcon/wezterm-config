local wezterm = require("wezterm")

local projects = {}

local function get_file_name(file)
	local file_name = file:match("[^/]*.lua$")
	return file_name:sub(0, #file_name - 4)
end

local function find_project_files()
	local core_project_dir = wezterm.home_dir .. "/.config/wezterm/projects"
	local local_project_dir = wezterm.home_dir .. "/.config/wezterm-projects"

	local all_projects = {}
	local core_project_files = wezterm.glob(core_project_dir .. "/*.lua")
	local local_project_files = wezterm.glob(local_project_dir .. "/*.lua")

	table.move(core_project_files, 1, #core_project_files, 1, all_projects)
	table.move(local_project_files, 1, #local_project_files, #all_projects + 1, all_projects)

	return all_projects
end

local function get_project_choices()
	local choices = {}

	for _, proj_path in ipairs(find_project_files()) do
		local proj_name = get_file_name(proj_path)
		table.insert(choices, #choices + 1, {
			label = proj_name,
			id = proj_path,
		})
	end

	return choices
end

function projects.get_input_selector()
	return {
		action = wezterm.action_callback(function(window, pane, id, label)
			local project_config = dofile(id)

			local project_startup = project_config.startup

			-- Check the project_startup is set and is a function
			if project_startup == nil or type(project_startup) ~= "function" then
				wezterm.log_error(
					"Project "
						.. label
						.. " has no exported 'startup' function (type is "
						.. type(project_startup)
						.. ")"
				)
				return
			end

			project_startup(wezterm)
		end),
		title = "Project Workspaces",
		choices = get_project_choices(),
	}
end

return projects
