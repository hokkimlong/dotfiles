-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.hide_tab_bar_if_only_one_tab = true
config.font_size = 16.0
config.font = wezterm.font("MesloLGL Nerd Font")

-- and finally, return the configuration to wezterm
return config
