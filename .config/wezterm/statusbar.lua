local wezterm = require('wezterm')

-- モード別の色。active_key_table() が nil の時は DEFAULT_STYLE。
local DEFAULT_STYLE = { name = 'NORMAL', bg = '#ffb6c1', fg = '#3d1f2a' }
local MODE_STYLES = {
  copy_mode   = { name = 'COPY',   bg = '#ffd700', fg = '#3d2f00' },
  search_mode = { name = 'SEARCH', bg = '#ffd700', fg = '#3d2f00' },
  resize_pane = { name = 'RESIZE', bg = '#39FF14', fg = '#0d2a05' },
}

local LEFT_DIVIDER = utf8.char(0xe0ba)
local RIGHT_DIVIDER = utf8.char(0xe0bc)

-- ペインごとに最後に流したカーソル色を覚え、変化時だけ OSC 12 を書き込む。
local last_cursor_by_pane = {}

wezterm.on('update-status', function(window, pane)
  local key_table = window:active_key_table()
  local style = (key_table and MODE_STYLES[key_table]) or DEFAULT_STYLE
  local workspace = window:active_workspace()

  local label = ' ' .. workspace
  if key_table then
    label = label .. ' · ' .. style.name
  end
  label = label .. ' '

  window:set_left_status(wezterm.format({
    { Background = { Color = 'none' } },
    { Text = ' ' },
    { Foreground = { Color = style.bg } },
    { Text = LEFT_DIVIDER },
    { Background = { Color = style.bg } },
    { Foreground = { Color = style.fg } },
    { Attribute = { Intensity = 'Bold' } },
    { Text = label },
    { Background = { Color = 'none' } },
    { Foreground = { Color = style.bg } },
    { Text = RIGHT_DIVIDER },
  }))

  local pane_id = pane:pane_id()
  if last_cursor_by_pane[pane_id] ~= style.bg then
    pane:inject_output(string.format('\x1b]12;%s\x07', style.bg))
    last_cursor_by_pane[pane_id] = style.bg
  end
end)
