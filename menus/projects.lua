local wezterm = require("wezterm")

return {
	action = wezterm.action_callback(function(window, pane, id, label)
		if not id and not label then
			wezterm.log_info("cancelled")
		else
			wezterm.log_info("you selected ", id, label)
			pane:send_text(id)
		end
	end),
	title = "I am title",
	choices = {
		-- This is the first entry
		{
			-- Here we're using wezterm.format to color the text.
			-- You can just use a string directly if you don't want
			-- to control the colors
			label = wezterm.format({
				{ Foreground = { AnsiColor = "Red" } },
				{ Text = "No" },
				{ Foreground = { AnsiColor = "Green" } },
				{ Text = " thanks" },
			}),
			-- This is the text that we'll send to the terminal when
			-- this entry is selected
			id = "Regretfully, I decline this offer.",
		},
		-- This is the second entry
		{
			label = "WTF?",
			id = "An interesting idea, but I have some questions about it.",
		},
		-- This is the third entry
		{
			label = "LGTM",
			id = "This sounds like the right choice",
		},
	},
}
