-- this file can be loaded by calling `lua require('plugins')` from your init.vim
-- only required if you have packer configured as `opt`

-- ensuring packer is installed properly
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Fuzzy finder <leader>pf
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                          , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- theme
    use { "catppuccin/nvim", as = "catppuccin", config = function() vim.cmd('colorscheme catppuccin') end }
    -- syntax highlighting
    use({ 'nvim-treesitter/nvim-treesitter', { run = ':tsupdate' } })
    -- git for nvim <leader>gs
    use('tpope/vim-fugitive')
    -- Edit hitory <leader>u
    use('mbbill/undotree')
    -- Automaticaly places closing brackets and newlines
    use('jiangmiao/auto-pairs')
    -- surround text, Visual: s[char], Normal: cs[char][char]
    use('tpope/vim-surround')
    -- lsp setup, pending fix
    use {
        'vonheikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- lsp support
            { 'neovim/nvim-lspconfig' },             -- required
            { 'williamboman/mason.nvim' },           -- optional
            { 'williamboman/mason-lspconfig.nvim' }, -- optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
    -- Game
    -- use('ThePrimeagen/vim-be-good')
    -- Makes transparent
    use('xiyaowong/transparent.nvim')
    -- Comments blocks: gbc, lines: gcc
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- Status Line
    use('feline-nvim/feline.nvim')
    use('nvim-tree/nvim-web-devicons')
    -- In File Navigator <leader>N
    use {
        "SmiteshP/nvim-navbuddy",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "numToStr/Comment.nvim",        -- Optional
            "nvim-telescope/telescope.nvim" -- Optional
        }
    }
    -- HTML tag auto closing
    -- use{
    --     'windwp/nvim-ts-autotag',
    --     config = function ()
    --         require('nvim-ts-autotag').setup()
    --     end
    -- }
    use('windwp/nvim-ts-autotag')
    -- tmux pane navigation integration (ctrl-[hjkl])
    use('christoomey/vim-tmux-navigator')

    if packer_bootstrap then
        require('packer').sync()
    end
end)
