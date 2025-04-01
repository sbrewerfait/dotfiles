local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.color_scheme = "NvimLight"

config.font = wezterm.font("Hurmit Nerd Font Mono")
config.font_size = 17.6

config.hide_tab_bar_if_only_one_tab = true

config.colors = {
	cursor_border = "#8cfd35",
	cursor_bg = "#8cfd35",
}

config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

config.window_decorations = "RESIZE"

return config
