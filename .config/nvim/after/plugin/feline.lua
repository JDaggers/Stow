local line_ok, feline = pcall(require, "feline")
if not line_ok then
    return
end

-- taken from catpuccin.com/palette
local catpuccin_mocha = {
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
    bg = "#181825",
    fg =  "#cdd6f4",
}

local colors = {
    fg = "text",
    bg = "mantle",
    bg_lighter = "surface0",
    git_branch = "flamingo",
    git_added = "green",
    git_removed = "maroon",
    error = "maroon",
    warning = "yellow",
    hint = "sapphire",
    lsp = "mauve",
    file_type = "maroon",
    encoding = "peach",
    position = "green",
    scroll_percentage = "sapphire",
    scroll_bar = "yellow",
}

local vi_mode_colors = {
    NORMAL = "green",
    OP = "green",
    INSERT = "yellow",
    VISUAL = "mauve",
    LINES = "peach",
    BLOCK = "red",
    REPLACE = "maroon",
    COMMAND = "sapphire",
}

local c = {
    vim_mode = {
        provider = {
            name = "vi_mode",
            opts = {
                show_mode_name = true,
                -- padding = "center", -- Uncomment for extra padding.
            },
        },
        hl = function()
            return {
                fg = require("feline.providers.vi_mode").get_mode_color(),
                bg = colors.bg_lighter,
                style = "bold",
                name = "NeovimModeHLColor",
            }
        end,
        left_sep = "block",
        right_sep = "right_rounded",
    },
    gitBranch = {
        provider = "git_branch",
        hl = {
            fg = colors.git_branch,
            bg = colors.bg_lighter,
            style = "bold",
        },
        left_sep = "left_rounded",
        right_sep = "block",
    },
    gitDiffAdded = {
        provider = "git_diff_added",
        hl = {
            fg = colors.git,
            bg = colors.bg_lighter,
        },
        left_sep = "block",
        right_sep = "block",
    },
    gitDiffRemoved = {
        provider = "git_diff_removed",
        hl = {
            fg = "maroon",
            bg = colors.bg_lighter,
        },
        left_sep = "block",
        right_sep = "block",
    },
    gitDiffChanged = {
        provider = "git_diff_changed",
        hl = {
            fg = colors.fg,
            bg = colors.bg_lighter,
        },
        left_sep = "block",
        right_sep = "right_rounded",
    },
    separator = {
        provider = " ",
    },
    spacer_left = {
        provider = " ",
        hl = {
            fg = colors.fg,

            bg = colors.bg_lighter,
        },
        left_sep = "left_rounded",
        right_sep = "block",
    },
    spacer_right = {
        provider = " ",
        hl = {
            fg = colors.fg,

            bg = colors.bg_lighter,
        },
        left_sep = "block",
        right_sep = "right_rounded",
    },
    fileinfo = {
        provider = {
            name = "file_info",
            opts = {
                type = "relative-short",
            },
        },
        hl = {
            style = "bold",
        },
        left_sep = " ",
        right_sep = " ",
    },
    diagnostic_errors = {
        provider = "diagnostic_errors",
        hl = {
            fg = colors.error,
        },
    },
    diagnostic_warnings = {
        provider = "diagnostic_warnings",
        hl = {
            fg = colors.warning,
        },
    },
    diagnostic_hints = {
        provider = "diagnostic_hints",
        hl = {
            fg = colors.hint,
        },
    },
    diagnostic_info = {
        provider = "diagnostic_info",
    },
    lsp_client_names = {
        provider = "lsp_client_names",
        hl = {
            fg = colors.lsp,
            bg = colors.bg_lighter,
            style = "bold",
        },
        left_sep = "block",
        right_sep = "block",
    },
    file_type = {
        provider = {
            name = "file_type",
            opts = {
                filetype_icon = true,
                case = "titlecase",
            },
        },
        hl = {
            fg = colors.file,
            bg = colors.bg_lighter,
            style = "bold",
        },
        left_sep = "block",
        right_sep = "block",
    },
    file_encoding = {
        provider = "file_encoding",
        hl = {
            fg = colors.encoding,
            bg = colors.bg_lighter,
            style = "bold",
        },
        left_sep = "block",
        right_sep = "block",
    },
    position = {
        provider = "position",
        hl = {
            fg = colors.position,
            bg = colors.bg_lighter,
            style = "bold",
        },
        left_sep = "block",
        right_sep = "block",
    },
    line_percentage = {
        provider = "line_percentage",
        hl = {
            fg = colors.scroll_percentage,
            bg = colors.bg_lighter,
            style = "bold",
        },
        left_sep = "block",
        right_sep = "block",
    },
    scroll_bar = {
        provider = "scroll_bar",
        hl = {
            fg = colors.scroll_bar,
            style = "bold",
        },
    },
}

local left = {
    c.vim_mode,
    c.separator,
    c.gitBranch,
    c.gitDiffAdded,
    c.gitDiffRemoved,
    c.gitDiffChanged,
    c.separator,
    c.fileinfo,
    c.separator,
    c.diagnostic_errors,
    c.diagnostic_warnings,
    c.diagnostic_info,
    c.diagnostic_hints,
}

local middle = {
}

local right = {
    c.spacer_left,
    c.lsp_client_names,
    c.file_type,
    c.file_encoding,
    c.position,
    c.line_percentage,
    c.scroll_bar,
}

local components = {
    active = {
        left,
        middle,
        right,
    },
    inactive = {
        left,
        middle,
        right,
    },
}

feline.setup({
    components = components,
    theme = catpuccin_mocha,
    vi_mode_colors = vi_mode_colors,
})

-- style command line to be of uniform colorscheme
local gui_command = "highlight MsgArea guibg=" .. catpuccin_mocha.mantle .. " guifg=" .. catpuccin_mocha.text
vim.cmd(gui_command)
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    command = gui_command
})
