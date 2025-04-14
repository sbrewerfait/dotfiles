local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "BlulocoDark"

config.font = wezterm.font("Hurmit Nerd Font Mono")
config.font_size = 17.6

config.hide_tab_bar_if_only_one_tab = true

config.colors = {
--     background = "#16145A",
    foreground = "#ff3336",
    background = "black",
-- 	foreground = "lightGray",
-- 	cursor_border = "#8cfd35",
-- 	cursor_bg = "#8cfd35",
}

-- config.window_background_image = '/Users/sbrewer/Pictures/linux_terminal_wallpaper.png'

config.window_background_opacity = 0.7
config.macos_window_background_blur = 20

config.window_decorations = "RESIZE"

return config
