local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local target = wezterm.target_triple

if target:find("x86_64") then
	config.color_scheme = "Chalk (dark) (terminal.sexy)"
else
	-- config.color_scheme = "Chalk (dark) (terminal.sexy)"
	config.color_scheme = "Nocturnal Winter"
	-- config.color_scheme = "Cyberpunk Scarlet Protocol"
end

config.font = wezterm.font("JetBrains Mono")

config.hide_tab_bar_if_only_one_tab = true

config.colors = {
	cursor_bg = "#8cfd35",
	cursor_border = "#8cfd35",
}

config.window_background_opacity = 0.9

return config
