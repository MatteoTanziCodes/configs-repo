local wezterm = require 'wezterm'

return {
  default_prog = { "pwsh.exe", "-NoLogo" },
  font = wezterm.font_with_fallback({ "JetBrainsMono Nerd Font", "FiraCode Nerd Font" }),
  font_size = 12.5,
  color_scheme = "Catppuccin Mocha", -- optional, change as you like
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  enable_scroll_bar = false,
  enable_wayland = false, -- just in case on WSL

  keys = {
     { key = "h", mods = "CTRL|ALT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
     { key = "v", mods = "CTRL|ALT", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
     { key = "f", mods = "CTRL|ALT", action = "ToggleFullScreen" },
     { key = "r", mods = "CTRL|ALT", action = wezterm.action.ReloadConfiguration },
     { key = "k", mods = "CTRL|ALT", action = wezterm.action.ClearScrollback "ScrollbackOnly" },
   }  
}
