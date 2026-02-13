-- Pull in the wezterm API
local wezterm = require "wezterm"

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.colors = {
--   foreground = "#D6DBE5",
--   -- background = "#000000",
--   background = "#111111",
--   -- cursor_bg = "#47FF9C",
--   -- cursor_border = "#47FF9C",
--   -- cursor_fg = "#011423",
--   selection_bg = "#706b4e",
--   selection_fg = "#f3d9c4",
--   ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
--   brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }
config.colors = {
  foreground = "#c0caf5",
  -- background = "#1a1b26",
  background = "#111111",
  cursor_bg = "#c0caf5",
  cursor_border = "#c0caf5",
  cursor_fg = "#1a1b26",
  selection_bg = "#283457",
  selection_fg = "#c0caf5",
  split = "#7aa2f7",
  compose_cursor = "#ff9e64",
  scrollbar_thumb = "#292e42",
  ansi = { "#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
  brights = { "#414868", "#ff899d", "#9fe044", "#faba4a", "#8db0ff", "#c7a9ff", "#a4daff", "#c0caf5" },
}
-- config.font = wezterm.font("FiraCode Nerd Font", { weight = "Medium" })
config.font = wezterm.font("JetbrainsMono Nerd Font", { weight = "Medium" })
config.font_size = 12

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.90
config.macos_window_background_blur = 30

-- and finally, return the configuration to wezterm
return config
