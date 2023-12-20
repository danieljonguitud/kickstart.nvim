-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Dark+'
  else
    return 'One Light (base16)'
  end
end

-- This is where you actually apply your config choices

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 14.0
config.font_rules = {
  {
    intensity = "Bold",
    italic = false,
    font = wezterm.font("JetBrainsMono Nerd Font",
      {
	weight = "Bold",
	stretch = "Normal",
	style = "Normal"
      }
    ),
  },
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font("JetBrainsMono Nerd Font",
      { weight = "Bold",
	stretch = "Normal",
	style = "Italic"
      }
    ),
  },
}
config.color_scheme = scheme_for_appearance(get_appearance())
config.window_padding = {
  left = 10,
  right = 0,
  top = 10,
  bottom = 0,
}

-- Tabs
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true

-- and finally, return the configuration to wezterm
return config
