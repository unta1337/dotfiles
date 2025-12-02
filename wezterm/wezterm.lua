local wezterm = require 'wezterm'

local config = wezterm.config_builder()

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { 'pwsh' }
elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
    config.default_prog = { 'bash' }
end

config.window_padding = {
    left = '5pt',
    right = '5pt',
    top = '5pt',
    bottom = '5pt',
}

config.initial_cols = 120
config.initial_rows = 32

config.color_scheme = 'Tokyo Night'

config.adjust_window_size_when_changing_font_size = false
config.font_size = 12
config.font = wezterm.font 'Sarasa Term K Nerd Font'
config.font_rules = {
    {
        intensity = 'Half',
        italic = false,
        font = wezterm.font {
            family = 'Sarasa Term K Nerd Font',
            weight = 'Bold',
            italic = false,
        }
    },
    {
        intensity = 'Half',
        italic = true,
        font = wezterm.font {
            family = 'Sarasa Term K Nerd Font',
            weight = 'Bold',
            italic = true,
        }
    },
    {
        intensity = 'Normal',
        italic = false,
        font = wezterm.font {
            family = 'Sarasa Term K Nerd Font',
            weight = 'Bold',
            italic = false,
        }
    },
    {
        intensity = 'Normal',
        italic = true,
        font = wezterm.font {
            family = 'Sarasa Term K Nerd Font',
            weight = 'Bold',
            italic = true,
        }
    },
    {
        intensity = 'Bold',
        italic = false,
        font = wezterm.font {
            family = 'Sarasa Term K Nerd Font',
            weight = 'Bold',
            italic = false,
        }
    },
    {
        intensity = 'Bold',
        italic = true,
        font = wezterm.font {
            family = 'Sarasa Term K Nerd Font',
            weight = 'Bold',
            italic = true,
        }
    }
}

config.enable_tab_bar = false
config.cursor_blink_rate = 0

return config
