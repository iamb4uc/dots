require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'neovim/nvim-lspconfig', requires = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'j-hui/fidget.nvim', 'folke/neodev.nvim', }, }
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' }, }
  use { 'nvim-treesitter/nvim-treesitter', run = function() pcall(require('nvim-treesitter.install').update { with_sync = true }) end, }
  use 'lewis6991/gitsigns.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'tamton-aquib/staline.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'numToStr/Comment.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'p00f/nvim-ts-rainbow'
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use 'folke/which-key.nvim'
  use 'vimwiki/vimwiki'
  use 'tpope/vim-fugitive'
  use 'folke/zen-mode.nvim'
  use { 'goolord/alpha-nvim', requires = { 'nvim-tree/nvim-web-devicons' }, config = function () require'alpha'.setup(require'alpha.themes.startify'.config) end }
  use "chip/telescope-software-licenses.nvim"

end)
