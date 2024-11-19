local line_ok, feline = pcall(require, "feline")
if not line_ok then
    return
end

-- taken from catpuccin.com/palette
local catpuccin_mocha = {
    fg = "#cdd6f4",    -- text
    bg = "#1e1e2e",    -- base
    green = "#a6e3a1", -- green
    yellow = "#f9e2af", -- yellow
    mauve = "#cba6f7", -- mauve
    peach = "#fab387", -- peach
    flamingo = "#f2cdcd", -- flamingo
    maroon = "#eba0ac", -- maroon
    sapphire = "#74c7ec", -- sapphire
    blue = "#89b4fa",  -- blue
    crust = "#11111b", -- crust
    red = "#f38ba8",   -- red
    overlay0 = "#6c7086", -- overlay 0
    surface0 = "#313244", -- surface 0
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
                bg = "surface0",
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
            fg = "flamingo",
            bg = "surface0",
            style = "bold",
        },
        left_sep = "left_rounded",
        right_sep = "block",
    },
    gitDiffAdded = {
        provider = "git_diff_added",
        hl = {
            fg = "green",
            bg = "surface0",
        },
        left_sep = "block",
        right_sep = "block",
    },
    gitDiffRemoved = {
        provider = "git_diff_removed",
        hl = {
            fg = "maroon",
            bg = "surface0",
        },
        left_sep = "block",
        right_sep = "block",
    },
    gitDiffChanged = {
        provider = "git_diff_changed",
        hl = {
            fg = "fg",
            bg = "surface0",
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
            fg = "fg",
            bg = "surface0"
        },
        left_sep = "left_rounded",
        right_sep = "block",
    },
    spacer_right = {
        provider = " ",
        hl = {
            fg = "fg",
            bg = "surface0"
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
            fg = "maroon",
        },
    },
    diagnostic_warnings = {
        provider = "diagnostic_warnings",
        hl = {
            fg = "yellow",
        },
    },
    diagnostic_hints = {
        provider = "diagnostic_hints",
        hl = {
            fg = "sapphire",
        },
    },
    diagnostic_info = {
        provider = "diagnostic_info",
    },
    lsp_client_names = {
        provider = "lsp_client_names",
        hl = {
            fg = "mauve",
            bg = "surface0",
            style = "bold",
        },
        left_sep = "left_rounded",
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
            fg = "maroon",
            bg = "surface0",
            style = "bold",
        },
        left_sep = "block",
        right_sep = "block",
    },
    file_encoding = {
        provider = "file_encoding",
        hl = {
            fg = "peach",
            bg = "surface0",
            style = "bold",
        },
        left_sep = "block",
        right_sep = "block",
    },
    position = {
        provider = "position",
        hl = {
            fg = "green",
            bg = "surface0",
            style = "bold",
        },
        left_sep = "block",
        right_sep = "block",
    },
    line_percentage = {
        provider = "line_percentage",
        hl = {
            fg = "sapphire",
            bg = "surface0",
            style = "bold",
        },
        left_sep = "block",
        right_sep = "block",
    },
    scroll_bar = {
        provider = "scroll_bar",
        hl = {
            fg = "yellow",
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
local gui_command = "highlight MsgArea guibg=" .. catpuccin_mocha.bg .. " guifg=" .. catpuccin_mocha.fg
vim.cmd(gui_command)
