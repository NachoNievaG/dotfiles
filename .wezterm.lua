local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("Zed Mono")
config.font_size = 22
config.window_background_opacity = 0.7
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

wezterm.on("switch-to-left", function(window, pane)
	local tab = window:mux_window():active_tab()

	if tab:get_pane_direction("Left") ~= nil then
		window:perform_action(wezterm.action.ActivatePaneDirection("Left"), pane)
	else
		window:perform_action(wezterm.action.ActivateTabRelative(-1), pane)
	end
end)

wezterm.on("switch-to-right", function(window, pane)
	local tab = window:mux_window():active_tab()

	if tab:get_pane_direction("Right") ~= nil then
		window:perform_action(wezterm.action.ActivatePaneDirection("Right"), pane)
	else
		window:perform_action(wezterm.action.ActivateTabRelative(1), pane)
	end
end)

config.keys = {
	{
		key = "h",
		mods = "ALT",
		action = wezterm.action.EmitEvent("switch-to-left"),
	},
	{
		key = "j",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "ALT",
		action = wezterm.action.EmitEvent("switch-to-right"),
	},
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

config.color_scheme = "Gruvbox dark, hard (base16)"
config.force_reverse_video_cursor = true
return config
