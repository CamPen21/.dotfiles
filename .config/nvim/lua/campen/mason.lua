require("mason").setup()


require('mason-lspconfig').setup({
  -- Servers to auto-install
  ensure_installed = { 
    'lua_ls', 
    'gopls', 
    'pyright', 
    'ts_ls',  -- TypeScript
    'rust_analyzer',
  },
  
  -- Automatically enable installed servers
  automatic_enable = true,
  
  -- Or be selective:
  -- automatic_enable = {
  --   exclude = { "rust_analyzer" }  -- Don't auto-enable certain servers
  -- }
})
