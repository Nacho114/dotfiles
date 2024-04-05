-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- config.color_scheme = 'Batman'
config.color_scheme = 'Tokyo Night Storm'

config.window_background_opacity = 0.9

config.enable_tab_bar = false
config.window_decorations = "NONE"

config.default_prog = { 'distrobox', 'enter', 'arch_dev' }

-- close the terminal when I exit distrobox
config.exit_behavior = 'Close'

config.window_close_confirmation = 'NeverPrompt'


config.window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = -4,
}

-- and finally, return the configuration to wezterm
return config
