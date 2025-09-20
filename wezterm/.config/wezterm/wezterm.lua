local wezterm = require("wezterm")

local config = wezterm.config_builder()

local last_monitor_name = {}

wezterm.on("window-focus-changed", function(window, pane)
	-- Only run this logic when the window is focused
	if not window:is_focused() then
		return
	end

	local screens = wezterm.gui.screens()
	local active = screens and screens.active
	local window_id = window:window_id()

	-- Defensive: if we can't get the monitor name, do nothing
	if not (active and active.name) then
		return
	end

	-- Only update if the monitor changed
	if last_monitor_name[window_id] ~= active.name then
		if active.name == "Built-in Display" then
			window:set_config_overrides({ font_size = 24 })
		elseif active.name == "LG ULTRAGEAR+" then
			window:set_config_overrides({ font_size = 21 })
		elseif active.name == "VG27AQ1A" then
			window:set_config_overrides({ font_size = 14 })
		else
			window:set_config_overrides({ font_size = 14 })
		end
		last_monitor_name[window_id] = active.name
	end
end)

config.font = wezterm.font("JetBrains Mono")
-- config.font_size = 25
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.color_scheme_dirs = {
	"/Users/sbrewer/.config/wezterm/colors",
}

-- config.color_scheme = "BlulocoDark"
-- config.color_scheme = "Adventure Time (Gogh)"
config.color_scheme = "sbrewer_theme"

-- config.font = wezterm.font("Hurmit Nerd Font Mono")
-- config.font_size = 25

config.hide_tab_bar_if_only_one_tab = true

config.colors = {
	background = "black",
}

-- config.initial_cols = 200
-- config.initial_rows = 50

config.window_background_opacity = 0.7
config.macos_window_background_blur = 20

config.window_decorations = "RESIZE"

return config
