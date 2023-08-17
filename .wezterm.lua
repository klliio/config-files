-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then config = wezterm.config_builder() end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'Hack Nerd Font Mono'

config.animation_fps = 1
config.scrollback_lines = 200
config.enable_tab_bar = false

config.inactive_pane_hsb = {saturation = 0.9, brightness = 0.8}

-- and finally, return the configuration to wezterm
return config
