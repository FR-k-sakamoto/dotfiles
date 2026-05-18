local wezterm = require('wezterm')

local config = wezterm.config_builder()
config.automatically_reload_config = true

require('appearance').apply(config)
require('tab')
require('statusbar')

--------------------------------------
-- keybinds
--------------------------------------
config.keys = require('keybinds').keys
config.key_tables = require('keybinds').key_tables
config.disable_default_key_bindings = true
config.leader = { key = 'q', mods = 'CTRL', timeout_milliseconds = 2000 }

return config
