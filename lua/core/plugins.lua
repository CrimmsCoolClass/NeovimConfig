require('packer').startup(function(use)
use 'wbthomason/packer.nvim'
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'
--use "rafamadriz/friendly-snippets"
use{
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate'
}
use 'EdenEast/nightfox.nvim'
use {"catppuccin/nvim", as = "catppuccin"}
use{
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires ={{'nvim-lua/plenary.nvim'}}
}
use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
}

use "akinsho/toggleterm.nvim"
end)

vim.cmd('colorscheme catppuccin-mocha')
