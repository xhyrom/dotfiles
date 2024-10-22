-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use {
	  "nvim-telescope/telescope.nvim", tag = "0.1.2",
	  -- or                            , branch = "0.1.x",
	  requires = { {"nvim-lua/plenary.nvim"} }
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use (
	  "nvim-treesitter/nvim-treesitter",
	  { run = ":TSUpdate" }
  )
  use "nvim-treesitter/playground"

  use "theprimeagen/harpoon"
  use "mbbill/undotree"
  use "tpope/vim-fugitive"
  use "jiriks74/presence.nvim"
  use "wakatime/vim-wakatime"
  use "github/copilot.vim"

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
	  "VonHeikemen/lsp-zero.nvim",
	  branch = "v2.x",
	  requires = {
		  -- LSP Support
		  {"neovim/nvim-lspconfig"},             -- Required
		  {"williamboman/mason.nvim"},           -- Optional
		  {"williamboman/mason-lspconfig.nvim"}, -- Optional

		  -- Autocompletion
		  {"hrsh7th/nvim-cmp"},     -- Required
		  {"hrsh7th/cmp-nvim-lsp"}, -- Required
		  {"L3MON4D3/LuaSnip"},     -- Required
	  }
  }

  use {
      "akinsho/toggleterm.nvim", tag = '*'
  }
end)
