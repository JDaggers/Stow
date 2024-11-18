require('catppuccin')

function ColorMyPencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
    vim.g.transparent_enabled = true;
end

ColorMyPencils()
