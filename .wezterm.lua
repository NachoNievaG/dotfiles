local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'UbuntuSansMono Nerd Font'
config.font_size = 22
config.cell_width = 1.05
config.window_background_opacity = 0.7
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true

config.keys = {
  {
    key = 'Enter',
    mods = 'ALT',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

config.color_scheme = 'Gruvbox Dark (Gogh)'
config.force_reverse_video_cursor = true
return config
