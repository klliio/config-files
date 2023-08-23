-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then config = wezterm.config_builder() end

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'Hack Nerd Font Mono'
config.default_cursor_style = "BlinkingBar"
config.window_decorations = "RESIZE"

config.animation_fps = 1
config.scrollback_lines = 200
config.enable_tab_bar = false

config.check_for_updates = false
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"


-- and finally, return the configuration to wezterm
return config
