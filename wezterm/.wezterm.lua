-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then config = wezterm.config_builder() end

config.colors = {
	background = '#11111b',   -- background
	foreground = '#cdd6f4',   -- text

	cursor_bg = '#f5e0dc',    -- background when cursor is block
	cursor_fg = '#11111b',    -- foreground when cursor is block
	cursor_border = '#cdd6f4', -- cursor colour when bar / block outline

	selection_bg = '#f5e0dc', -- background when text is selected
	selection_fg = '#11111b', -- text colour when selected

	scrollbar_thumb = '#313244', -- scrollbar
	split = '#313244',        -- split lines between panes

	ansi = {
		'#1e1e2e',
		'#f38ba8',
		'#a6e3a1',
		'#f9e2af',
		'#89b4fa',
		'#f5c2e7',
		'#94e2d5',
		'#bac2de',
	},
	brights = {
		'#1e1e2e',
		'#f38ba8',
		'#a6e3a1',
		'#f9e2af',
		'#89b4fa',
		'#f5c2e7',
		'#94e2d5',
		'#bac2de',
	},

	-- ?
	indexed = { [136] = '#0357df' },

	compose_cursor = '#f9e2af', -- show when a leader key is pressed

	copy_mode_active_highlight_bg = { Color = '#f5e0dc' },
	copy_mode_active_highlight_fg = { Color = '#11111b' },
	copy_mode_inactive_highlight_bg = { Color = '#bac2de' },
	copy_mode_inactive_highlight_fg = { Color = '#11111b' },
}

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'Hack Nerd Font Mono'
config.font_size = 14.0
config.default_cursor_style = "BlinkingUnderline"
config.window_decorations = "RESIZE"

config.animation_fps = 1
config.scrollback_lines = 200
config.enable_tab_bar = false

config.check_for_updates = false
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.enable_wayland = true


-- and finally, return the configuration to wezterm
return config
