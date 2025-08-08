local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Windows
if string.find(wezterm.target_triple, 'windows') then
  -- Use Powershell
  config.default_prog = { 'pwsh.exe' }
end

return config