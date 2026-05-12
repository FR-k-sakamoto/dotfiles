local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config.automatically_reload_config = true

config.font = wezterm.font 'FiraCode Nerd Font'
config.color_scheme = 'Afterglow (Gogh)'
config.font_size = 12
config.use_ime = true
config.window_background_opacity = 0.75
config.macos_window_background_blur = 20
config.window_decorations = 'RESIZE' 

config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_frame = {
    inactive_titlebar_bg = 'none',
    active_titlebar_bg = 'none',
}
config.window_background_gradient = {
    colors = { '#000000' },
}
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.colors = {
    tab_bar = {
        background = 'rgba(0, 0, 0, 0)',
        inactive_tab_edge = 'none',
    },
}
-- タブに色をつける
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local raw_title = (tab.tab_title and #tab.tab_title > 0) and tab.tab_title or tab.active_pane.title
    local title = ' ' .. wezterm.truncate_right(raw_title, max_width - 2) .. ' '
    
    local active_bg = '#a8e6cf'
    local active_fg = '#1a3d2a'
    local inactive_bg = '#2c2c2c'
    local inactive_fg = '#888888'
    
    local LEFT_DIVIDER = utf8.char(0xe0ba)  --
    local RIGHT_DIVIDER = utf8.char(0xe0bc) --

    local bg = tab.is_active and active_bg or inactive_bg
    local fg = tab.is_active and active_fg or inactive_fg
    local intensity = tab.is_active and 'Bold' or 'Normal'

    return {
        { Background = { Color = 'rgba(0, 0, 0, 0)' } },
        { Foreground = { Color = bg } },
        { Text = LEFT_DIVIDER },
        { Background = { Color = bg } },
        { Foreground = { Color = fg } },
        { Attribute = { Intensity = intensity } },
        { Text = title },
        { Attribute = { Intensity = 'Normal' } },
        { Background = { Color = 'rgba(0, 0, 0, 0)' } },
        { Foreground = { Color = bg } },
        { Text = RIGHT_DIVIDER .. ' ' },
    }
end)

-- 左下にワークスペース名を常時表示
wezterm.on('update-status', function(window, pane)
    local workspace = window:active_workspace()
    local bg = '#ffb6c1'
    local fg = '#3d1f2a'
    local LEFT_DIVIDER = utf8.char(0xe0ba)  --
    local RIGHT_DIVIDER = utf8.char(0xe0bc) --

    window:set_left_status(wezterm.format({
        { Background = { Color = 'none' } },
        { Text = ' ' },
        { Foreground = { Color = bg } },
        { Text = LEFT_DIVIDER },
        { Background = { Color = bg } },
        { Foreground = { Color = fg } },
        { Attribute = { Intensity = 'Bold' } },
        { Text = ' ' .. workspace .. ' ' },
        { Background = { Color = 'none' } },
        { Foreground = { Color = bg } },
        { Text = RIGHT_DIVIDER },
    }))
end)

--------------------------------------
-- keybinds
--------------------------------------
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.disable_default_key_bindings = true
config.leader = { key = "g", mods = "CTRL", timeout_milliseconds = 2000 }

return config
