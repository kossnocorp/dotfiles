local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Windows
if string.find(wezterm.target_triple, 'windows') then
  -- Use Powershell
  config.default_prog = { 'pwsh.exe' }
end

-- GUI

-- Size
config.initial_cols = 120
config.initial_rows = 30

-- Window
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- Font
config.font = wezterm.font_with_fallback {
  'IosevkaTerm NF',
  -- macOS/newer? name
  'IosevkaTerm Nerd Font',
}
config.harfbuzz_features = { 'calt', 'ss01' }

return config