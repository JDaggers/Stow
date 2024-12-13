-- full config ref : https://wezfurlong.org/wezterm/config/lua/general.html
local wezterm = require "wezterm"
local config = wezterm.config_builder()
local act = wezterm.action
-- local mux = wezterm.mux

-- STARTUP, SHELL AND ENVS

-- changes window size on events, un-needed
-- wezterm.on("gui-startup", function()
--     local _, _, window = mux.spawn_window {}
--     window:gui_window():maximize()
-- end)
--
-- wezterm.on('window-focus-changed', function(window, _)
--         window:maximize()
-- end)

-- actual fits window resizing problem, just sets it too big initially and it resizes itself
config.initial_cols = 200
config.initial_rows = 200

-- config.set_enviroment_variables = {}
-- config.deafult_cwd = "$HOME"
-- config.default_prog = { "/bin/zsh" }

-- GENERAL

config.scrollback_lines = 5000
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.use_resize_increments = true

-- THEME

local mocha = {
    rosewater = "#f5e0dc",
    flamingo = "#f2cdcd",
    pink = "#f5c2e7",
    mauve = "#cba6f7",
    red = "#f38ba8",
    maroon = "#eba0ac",
    peach = "#fab387",
    yellow = "#f9e2af",
    green = "#a6e3a1",
    teal = "#94e2d5",
    sky = "#89dceb",
    sapphire = "#74c7ec",
    blue = "#89b4fa",
    lavender = "#b4befe",
    text = "#cdd6f4",
    subtext1 = "#bac2de",
    subtext0 = "#a6adc8",
    overlay2 = "#9399b2",
    overlay1 = "#7f849c",
    overlay0 = "#6c7086",
    surface2 = "#585b70",
    surface1 = "#45475a",
    surface0 = "#313244",
    base = "#1e1e2e",
    mantle = "#181825",
    crust = "#11111b",
}
config.color_scheme = "Catppuccin Mocha"

-- If I want to alter the colorscheme
local colors = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
config.colors = {
    background = mocha.mantle,
    tab_bar = {
        background = mocha.mantle,
        active_tab = {
            bg_color = mocha.mauve,
            fg_color = mocha.base,
            intensity = "Bold"
        },
        inactive_tab = {
            bg_color = mocha.surface1,
            fg_color = mocha.text,
            intensity = "Normal",
        },
    }
}
-- print(colors)
-- colors.background = "#000000" -- for example
-- color_schemes = ["new altered colorscheme"] = colors
-- color_scheme = "new altered colorscheme"

-- TERM APPEARANCE

config.enable_scroll_bar = false
config.window_decorations = "NONE"
config.window_padding = {
    left = 5,
    right = 0,
    top = 0,
    bottom = 0,
}
config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
}

-- config.window_background_image = '/path/to/wallpaper.jpg'
--
-- config.window_background_image_hsb = {
--   -- Darken the background image by reducing it to 1/3rd
--   brightness = 0.3,
--
--   -- You can adjust the hue by scaling its value.
--   -- a multiplier of 1.0 leaves the value unchanged.
--   hue = 1.0,
--
--   -- You can adjust the saturation also.
--   saturation = 1.0,
-- }

config.window_background_opacity = 0.9
config.text_background_opacity = 0.95

-- command_palette

config.command_palette_fg_color = mocha.mauve
config.command_palette_bg_color = mocha.crust

-- TAB BAR

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
-- config.show_close_tab_button_in_tabs = false
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.show_tabs_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_and_split_indices_are_zero_based = false
config.tab_bar_at_bottom = true
-- config.tab_bar_style =
config.tab_max_width = 32
config.use_fancy_tab_bar = false

-- FONT

wezterm.font("VictorMono Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
-- config.font = wezterm.font_with_fallback {
--   'Fira Code',
--   'DengXian',
-- }
-- config.font_size
-- config.cell_width
-- config.line_height
config.font = wezterm.font {
    family = 'JetBrains Mono',
    harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1', 'zero' },
}

-- KEYBINDINGS

config.disable_default_key_bindings = true
config.leader = { key = ' ', mods = "CTRL", timeout = 1000 }
config.keys = {
    -- reload config
    { key = 'R',          mods = "LEADER", action = act.ReloadConfiguration },
    -- quit
    { key = 'Q',          mods = "LEADER", action = act.QuitApplication },
    -- activate copy mode
    { key = '[',          mods = "LEADER", action = act.ActivateCopyMode },
    -- activate search mode
    { key = '/',          mods = "LEADER", action = act.Search { Regex = "" } },
    -- copy paste
    -- dont work with i3
    -- { key = 'c',          mods = "SUPER",  action = act.CopyTo "Clipboard" },
    -- { key = 'v',          mods = "SUPER",  action = act.PasteFrom "Clipboard" },
    { key = 'v',          mods = "CTRL",  action = act.PasteFrom "Clipboard" },
    -- command palette
    { key = 'p',          mods = "LEADER", action = act.ActivateCommandPalette },
    -- apparently I need this
    { key = 'L',          mods = "LEADER", action = act.ShowDebugOverlay },
    -- PANES
    -- split panes
    { key = 'v',          mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = 'h',          mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    -- switch panes -- Should probably think of better mods for these
    { key = 'UpArrow',    mods = "ALT",    action = act.ActivatePaneDirection "Up" },
    { key = 'k',          mods = "CTRL",   action = act.ActivatePaneDirection "Up" },
    { key = 'RightArrow', mods = "ALT",    action = act.ActivatePaneDirection "Right" },
    { key = 'l',          mods = "CTRL",   action = act.ActivatePaneDirection "Right" },
    { key = 'DownArrow',  mods = "ALT",    action = act.ActivatePaneDirection "Down" },
    { key = 'j',          mods = "CTRL",   action = act.ActivatePaneDirection "Down" },
    { key = 'LeftArrow',  mods = "ALT",    action = act.ActivatePaneDirection "Left" },
    { key = 'h',          mods = "CTRL",   action = act.ActivatePaneDirection "Left" },
    -- close pane
    { key = 'x',          mods = "LEADER", action = act.CloseCurrentPane { confirm = true } },
    -- WINDOWS -- "tabs" in wezterm
    -- new window
    { key = 'c',          mods = "LEADER", action = act.SpawnTab "CurrentPaneDomain" },
    -- switch window
    { key = "RightArrow", mods = "SHIFT",  action = act.ActivateTabRelative(1) },
    { key = "LeftArrow",  mods = "SHIFT",  action = act.ActivateTabRelative(-1) },
    -- close window
    { key = 'd',          mods = "LEADER", action = act.CloseCurrentTab { confirm = false } },
    -- Sessions -- "workspaces" in wezterm
    { key = 'w',          mods = "LEADER", action = act.ShowLauncherArgs { flags = "FUZZY|TABS|WORKSPACES|DOMAINS|LAUNCH_MENU_ITEMS" } },
}
-- key tables, like modes in vim
config.key_tables = {
    -- copy mode
    copy_mode = {
        -- visual mode selection
        {
            key = 'V',
            mods = 'SHIFT',
            action = act.CopyMode { SetSelectionMode = 'Line' },
        },
        {
            key = 'v',
            mods = 'NONE',
            action = act.CopyMode { SetSelectionMode = 'Cell' },
        },
        {
            key = 'v',
            mods = 'CTRL',
            action = act.CopyMode { SetSelectionMode = 'Block' },
        },

        -- yank
        { key = 'y',          mods = 'NONE',  action = act.Multiple { { CopyTo = 'ClipboardAndPrimarySelection' }, { CopyMode = 'MoveToScrollbackBottom' }, { CopyMode = 'Close' }, }, },

        -- viewport or scrollback jump
        { key = 'G',          mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
        { key = 'g',          mods = "NONE",  action = act.CopyMode "MoveToViewportTop" },
        { key = 'g',          mods = 'CTRL',  action = act.CopyMode 'MoveToScrollbackTop', },

        -- line-wise movements
        { key = 'I',          mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent', },
        { key = '$',          mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent', },
        { key = '0',          mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },
        { key = 'Enter',      mods = 'NONE',  action = act.CopyMode 'MoveToStartOfNextLine', },

        -- exit without yanking
        { key = 'c',          mods = 'CTRL',  action = act.Multiple { { CopyMode = 'MoveToScrollbackBottom' }, { CopyMode = 'Close' }, }, },
        { key = 'q',          mods = 'NONE',  action = act.Multiple { { CopyMode = 'MoveToScrollbackBottom' }, { CopyMode = 'Close' }, }, },
        { key = 'Escape',     mods = 'NONE',  action = act.Multiple { { CopyMode = 'MoveToScrollbackBottom' }, { CopyMode = 'Close' }, }, },

        -- enter search_mode
        { key = '/',          mods = "NONE",  action = act.Search("CurrentSelectionOrEmptyString") },

        -- half page up and down
        { key = 'u',          mods = 'CTRL',  action = act.CopyMode { MoveByPage = -0.5 } },
        { key = 'd',          mods = 'CTRL',  action = act.CopyMode { MoveByPage = 0.5 }, },

        -- word-wise manuevers
        { key = 'b',          mods = 'NONE',  action = act.CopyMode 'MoveBackwardWord' },
        { key = 'w',          mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
        { key = 'e',          mods = 'NONE',  action = act.CopyMode 'MoveForwardWordEnd', },
        { key = 'LeftArrow',  mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord', },
        { key = 'RightArrow', mods = 'SHIFT', action = act.CopyMode 'MoveForwardWord', },

        -- char-wise movements
        { key = 'h',          mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
        { key = 'j',          mods = 'NONE',  action = act.CopyMode 'MoveDown' },
        { key = 'k',          mods = 'NONE',  action = act.CopyMode 'MoveUp' },
        { key = 'l',          mods = 'NONE',  action = act.CopyMode 'MoveRight' },
        { key = 'LeftArrow',  mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
        { key = 'UpArrow',    mods = 'NONE',  action = act.CopyMode 'MoveUp' },
        { key = 'DownArrow',  mods = 'NONE',  action = act.CopyMode 'MoveDown' },
        { key = 'RightArrow', mods = 'NONE',  action = act.CopyMode 'MoveRight' },

        --selection-wise movements
        { key = 'o',          mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEnd', }, --
        { key = 'O',          mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz', },

        -- move between matches
        { key = 'n',          mods = 'NONE',  action = act.CopyMode 'PriorMatch' },
        { key = 'N',          mods = 'SHIFT', action = act.CopyMode 'NextMatch' },
        { key = 'Enter',      mods = 'NONE',  action = act.CopyMode 'PriorMatch' },

        -- clears search patterm
        { key = 'Backspace',  mods = 'CTRL',  action = act.CopyMode 'ClearPattern' },
    },
    search_mode = {
        -- enter and escape
        { key = 'Escape',    mods = 'NONE',       action = act.CopyMode 'Close' },
        { key = 'c',         mods = 'CTRL',       action = act.CopyMode 'Close' },
        -- accepts pattern and enter regular copy mode
        { key = 'Enter',     mods = 'NONE',       action = act.CopyMode 'AcceptPattern' },
        -- move between matches
        { key = 'n',         mods = 'CTRL',       action = act.CopyMode 'PriorMatch' },
        { key = 'N',         mods = 'SHIFT|CTRL', action = act.CopyMode 'NextMatch' },
        -- cycles between case-sensitive, case-insensitive and regex matches
        { key = 'r',         mods = 'CTRL',       action = act.CopyMode 'CycleMatchType' },
        -- clears search patterm
        { key = 'Backspace', mods = 'CTRL',       action = act.CopyMode 'ClearPattern' },
        -- half page up and down
        { key = 'u',         mods = 'CTRL',       action = act.Multiple { { CopyMode = "ClearSelectionMode" }, { CopyMode = { MoveByPage = -0.5 } } } },
        { key = 'd',         mods = 'CTRL',       action = act.Multiple { { CopyMode = "ClearSelectionMode" }, { CopyMode = { MoveByPage = 0.5 } } }, },
    },
}
-- switch to window(tab) by number -- the tab numbers display is 1 indexed but they are 0 indexed in the function. great
for i = 1, 9 do
    table.insert(config.keys, { key = tostring(i), mods = "LEADER", action = wezterm.action.ActivateTab(i - 1) })
end

return config
