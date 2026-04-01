local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config.automatically_reload_config = true

-- OS判定
local function is_windows()
    return wezterm.target_triple:find("windows") ~= nil
end

if is_windows() then
    config.wsl_domains = {
        {
            name = 'WSL:Ubuntu',
            distribution = 'Ubuntu',
            default_cwd = '~',
        },
    }
    config.default_domain = 'WSL:Ubuntu'
end

config.font = wezterm.font 'JetBrains Mono'
config.color_scheme = 'Afterglow (Gogh)'
config.font_size = 12
config.use_ime = true
config.window_background_opacity = 0.75
config.macos_window_background_blur = 20
config.window_decorations = 'RESIZE'
config.window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = false
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
        inactive_tab_edge = 'none',
    },
}
-- タブに色をつける
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local title = ' ' .. wezterm.truncate_right(tab.active_pane.title, max_width - 2) .. ' '
    
    local active_bg = '#d4843e'
    local active_fg = '#151515'
    local inactive_bg = '#2c2c2c'
    local inactive_fg = '#888888'
    
    local LEFT_DIVIDER = utf8.char(0xe0b6) -- 
    local RIGHT_DIVIDER = utf8.char(0xe0b4) -- 

    -- タブの「外側」の余白の定義
    local gap = { { Background = { Color = 'none' } }, { Text = ' ' } }

    if tab.is_active then
        return {
            gap[1], gap[2], -- 左に隙間
            { Foreground = { Color = active_bg } },
            { Text = LEFT_DIVIDER },
            { Background = { Color = active_bg } },
            { Foreground = { Color = active_fg } },
            { Attribute = { Intensity = 'Bold' } },
            { Text = title },
            { Background = { Color = 'none' } }, 
            { Foreground = { Color = active_bg } },
            { Text = RIGHT_DIVIDER },
            gap[1], gap[2], -- 右に隙間
        }
    end
    
    return {
        gap[1], gap[2],
        { Foreground = { Color = inactive_bg } },
        { Text = LEFT_DIVIDER },
        { Background = { Color = inactive_bg } },
        { Foreground = { Color = inactive_fg } },
        { Text = title },
        { Background = { Color = 'none' } },
        { Foreground = { Color = inactive_bg } },
        { Text = RIGHT_DIVIDER },
        gap[1], gap[2],
    }
end)

--------------------------------------
-- workspace indicator (タブバー左側)
--------------------------------------
wezterm.on('update-status', function(window, pane)
    local workspaces = wezterm.mux.get_workspace_names()
    local has_multiple_workspaces = #workspaces >= 2

    -- タブバー表示制御: ワークスペースが1つでタブも1つなら非表示
    local tab_count = #window:mux_window():tabs()
    local overrides = window:get_config_overrides() or {}
    local should_hide = (not has_multiple_workspaces) and (tab_count <= 1)
    if overrides.hide_tab_bar_if_only_one_tab ~= should_hide then
        overrides.hide_tab_bar_if_only_one_tab = should_hide
        window:set_config_overrides(overrides)
    end

    -- ワークスペースが2つ以上ある場合のみ左ステータスに表示
    if not has_multiple_workspaces then
        window:set_left_status('')
        return
    end

    local active = window:active_workspace()
    local ws_index = 0
    for i, name in ipairs(workspaces) do
        if name == active then ws_index = i break end
    end

    local LEFT_DIVIDER = utf8.char(0xe0b6)
    local RIGHT_DIVIDER = utf8.char(0xe0b4)
    local ws_bg = '#6a4c93'
    local ws_fg = '#e0e0e0'
    local count_bg = '#4a3473'
    local count_fg = '#b0b0b0'

    window:set_left_status(wezterm.format({
        { Text = '  ' },
        { Foreground = { Color = ws_bg } },
        { Text = LEFT_DIVIDER },
        { Background = { Color = ws_bg } },
        { Foreground = { Color = ws_fg } },
        { Attribute = { Intensity = 'Bold' } },
        { Text = '  ' .. active .. ' ' },
        { Background = { Color = count_bg } },
        { Foreground = { Color = count_fg } },
        { Text = ' ' .. ws_index .. '/' .. #workspaces .. ' ' },
        { Background = { Color = 'none' } },
        { Foreground = { Color = count_bg } },
        { Text = RIGHT_DIVIDER },
        { Text = '  ' },
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
