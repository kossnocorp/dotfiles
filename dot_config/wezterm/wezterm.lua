local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Windows
if string.find(wezterm.target_triple, 'windows') then
  config.default_prog = { 'powershell' }
end

return config