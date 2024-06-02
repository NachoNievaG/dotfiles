local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("Consolas")
config.font_size = 22
config.window_background_opacity = 0.7
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

config.color_scheme = "Gruvbox dark, hard (base16)"
config.force_reverse_video_cursor = true
return config
