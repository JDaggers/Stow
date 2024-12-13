local lsp = require('lsp-zero').preset('recommended')

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-€ý,€ý,
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
end)

-- hard installed
lsp.ensure_installed({
    'clangd',
    'pylsp',
    'lua_ls',
    'gopls',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-f>'] = cmp.mapping.confirm({ select = true }),
    ["<C-y>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

local lspconfig = require("lspconfig")

-- Configure lsp for lua
lspconfig.lua_ls.setup {
    lsp.nvim_lua_ls(),
    on_attach = function(client, bufnr)
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- configure lsp for clangd
lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
    end,
    filetypes = { "c", "cpp", "objc", "objcpp" }
}

-- configure lsp for pylsp
lspconfig.pylsp.setup {
    on_attach = function(client, bufnr)
    end
}

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    -- toggle reference list of hovered symbol
    local rr_active = false
    vim.keymap.set("n", "<leader>rr", function()
        if rr_active then
            vim.api.nvim_command('cclose')
        else
            vim.lsp.buf.references()
        end
        rr_active = not rr_active
    end, opts)
    -- toggle QuickFix list
    local qf_active = false
    vim.keymap.set("n", "<leader>Q", function()
        if qf_active then
            vim.api.nvim_command('cclose')
        else
            vim.diagnostic.setqflist({ open = true })
        end
        qf_active = not qf_active
    end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
