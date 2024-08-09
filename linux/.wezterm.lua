local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 14.0
config.color_scheme = 'Ayu Mirage'
config.window_background_opacity = 0.975

--[[ color schemes
  ChallengerDeep
  ayu
  Ayu Mirage
  Catppuccin Mocha
  Gruvbox Light
--]]

--[[
config.window_background_image = '/home/kauefraga/Pictures/himurakenshin.png'
config.window_background_image_hsb = {
  brightness = 0.025,
  hue = 1.0,
  saturation = 0.0,
} --]]

config.window_frame = {
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },
  font_size = 12.0,
  inactive_titlebar_bg = '#202024',
}

return config
