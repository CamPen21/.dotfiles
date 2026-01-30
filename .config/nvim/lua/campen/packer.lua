vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', version = '*',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
	  "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
  }
  use {
      'nvim-treesitter/nvim-treesitter', 
      lazy = false,
      build = ':TSUpdate'
  }
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use {'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use {
      'mason-org/mason.nvim'
  }
  use ('williamboman/mason-lspconfig.nvim') -- Optional
  use ('mfussenegger/nvim-jdtls')
  use ('hrsh7th/nvim-cmp')
  use ('hrsh7th/cmp-nvim-lsp')
  use ('L3MON4D3/LuaSnip')
  end)
