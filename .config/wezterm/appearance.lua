local wezterm = require('wezterm')

local M = {}

function M.apply(config)
  -- フォント / カラースキーム
  config.font = wezterm.font('FiraCode Nerd Font')
  config.font_size = 15
  config.color_scheme = 'Afterglow (Gogh)'
  config.use_ime = true

  -- ウィンドウ
  config.window_background_opacity = 0.75
  config.macos_window_background_blur = 20
  config.window_decorations = 'RESIZE'
  config.window_frame = {
    inactive_titlebar_bg = 'none',
    active_titlebar_bg = 'none',
  }
  config.window_background_gradient = {
    colors = { '#000000' },
  }

  -- タブバー
  config.hide_tab_bar_if_only_one_tab = false
  config.tab_bar_at_bottom = true
  config.use_fancy_tab_bar = false
  config.show_new_tab_button_in_tab_bar = false
  config.show_close_tab_button_in_tabs = false
  config.colors = {
    tab_bar = {
      background = 'rgba(0, 0, 0, 0)',
      inactive_tab_edge = 'none',
    },
  }
end

return M
