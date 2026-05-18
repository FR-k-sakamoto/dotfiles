local wezterm = require('wezterm')

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local raw_title = (tab.tab_title and #tab.tab_title > 0) and tab.tab_title or tab.active_pane.title
  local title = ' ' .. wezterm.truncate_right(raw_title, max_width - 2) .. ' '

  local active_bg = '#a8e6cf'
  local active_fg = '#1a3d2a'
  local inactive_bg = '#2c2c2c'
  local inactive_fg = '#888888'

  local LEFT_DIVIDER = utf8.char(0xe0ba)
  local RIGHT_DIVIDER = utf8.char(0xe0bc)

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
