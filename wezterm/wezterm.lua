local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
-- config.color_scheme = "Cyberpunk Scarlet Protocol"
config.color_scheme = "Nocturnal Winter"

config.hide_tab_bar_if_only_one_tab = true

config.colors = {
	cursor_bg = "#8cfd35",
	cursor_border = "#8cfd35",
}

config.window_background_opacity = 0.9

return config
