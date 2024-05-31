-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
config.enable_tab_bar = false

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Dracula'

config.font_size = 18
config.font = wezterm.font 'Monolisa'

config.window_background_opacity = 0.8
config.text_background_opacity = 0.8

-- and finally, return the configuration to wezterm
return config
