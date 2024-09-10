local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.use_fancy_tab_bar = false

config.font = wezterm.font_with_fallback {
    'Julia Mono',
    'Symbols Nerd Font'
}

config.color_scheme = "oldworld"

config.front_end = "WebGpu"

return config
