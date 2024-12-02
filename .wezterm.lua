-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Frappe"

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 14

config.line_height = 1.2

config.window_decorations = "RESIZE"

config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 20,
	right = 20,
	top = 32,
	bottom = 0,
}

config.term = "wezterm"

config.keys = {
	{ key = " ", mods = "SHIFT|CTRL", action = wezterm.action.QuickSelect },
}

-- and finally, return the configuration to wezterm
return config
