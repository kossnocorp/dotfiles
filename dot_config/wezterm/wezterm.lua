local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Windows
if string.find(wezterm.target_triple, 'windows') then
  -- Use Powershell
  config.default_prog = { 'pwsh.exe' }

  -- GUI
  config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
end

-- GUI
config.initial_cols = 120
config.initial_rows = 30

-- Font
config.font = wezterm.font('IosevkaTerm NF')
config.harfbuzz_features = { 'calt', 'ss01' }

return config