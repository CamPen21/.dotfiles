local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
lspconfig.jdtls.setup({
    autostart = false
})

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'rust_analyzer',
    'pyright',
    'gopls'
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.confirm(),
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function () vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function () vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function () vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function () vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function () vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function () vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function () vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function () vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>f", function () vim.lsp.buf.format() end, opts)
    vim.keymap.set("i", "<C-h>", function () vim.lsp.buf.signature_help() end, opts)
end)

lsp.set_preferences({
    sign_icons = {}
})


lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
