local wezterm = require("wezterm")

local config = wezterm.config_builder()

local last_monitor_name = {}
local last_by_window = {}

local function monitor_key(s)
	return s.description or s.name or string.format("%dx%d@%d,%d", s.width, s.height, s.x, s.y)
end

local function pick_font_for_screen(s)
	local n = (s.description or s.name or ""):lower()
	-- wezterm.log_info(n)
	-- wezterm.log_info(config.font)
	if n:find("built") then
		return 18
	end
	if n:find("ultragear") then
		return 20
	end
	if n:find("vg27aq1a") then
		return 14
	end
	if n:find("sidecar") then
		return 11.7
	end
	if n:find("u32j59") then
		return 25
	end
	if s.width >= 3840 then
		return 20
	end
	return 16
end

wezterm.on("window-focus-changed", function(window, pane)
	if not window:is_focused() then
		return
	end
	-- Defer so screens() reflects the new active display
	wezterm.time.call_after(0, function()
		local screens = wezterm.gui.screens()
		if not (screens and screens.active) then
			return
		end
		local active = screens.active
		local key = monitor_key(active)
		local wid = window:window_id()
		if last_by_window[wid] ~= key then
			window:set_config_overrides({ font_size = pick_font_for_screen(active) })
			last_by_window[wid] = key
		end
	end)
end)

-- config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("Hurmit Nerd Font")
config.font = wezterm.font("FiraCode Nerd Font")
-- config.font_size = 10
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
-- config.color_scheme = "pinky (base16)"
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
