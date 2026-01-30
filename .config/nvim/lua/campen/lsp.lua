local cmp = require('cmp')
cmp.setup {
    sources = {
        { name = 'nvim_lsp' }
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.confirm(),
    }),
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config['lua_ls'] = {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

vim.lsp.config['jdtls'] = {
    autostart = false
}

vim.lsp.config['gopls'] = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    capabilities = capabilities
}
vim.lsp.config['pyright'] = {
    filetypes = { 'python' }
}
vim.lsp.config['rust_analyzer'] = {
    filetypes = { 'rust' }
}

vim.lsp.enable({'eslint', 'rust_analyzer', 'pyright', 'gopls'})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'python', 'typescript', 'javascript', 'rust', 'lua', 'c', 'yaml', 'json', 'markdown', 'proto' },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
    end
    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end

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
  end,
})

vim.diagnostic.config({
    virtual_text = true
})
