local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "OneDark Darker"
config.font = wezterm.font({
    family = "JetBrains Mono",
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.font_size = 20.0

config.bidi_enabled = true
config.bidi_direction = "AutoLeftToRight"

config.hide_tab_bar_if_only_one_tab = true

-- Disable Ctrl + W wezterm's mapping
config.keys = {
    { key = "w", mods = "CTRL", action = wezterm.action({ SendString = "\x17" }) },
}

-- map CMD + <number> to tmux's prefix + <number>
local tmux_prefix = "\x02" -- Ctrl + B
for i = 0, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "CMD",
        action = wezterm.action({ SendString = tmux_prefix .. tostring(i) }),
    })
end

return config
