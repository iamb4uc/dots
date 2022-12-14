return require('packer').startup(function(use)
  ----------------------------------------------------------
  --                    Package Manager                   --
  ----------------------------------------------------------
  use { 'wbthomason/packer.nvim' }


  ----------------------------------------------------------
  --              Language Specific Plugins               --
  ----------------------------------------------------------
  -- CMP{{{
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-vsnip' }-- }}}

  -- LSP{{{
  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind.nvim'}
  use { 'williamboman/nvim-lsp-installer' }-- }}}

  -- Others{{{
  use { 'hrsh7th/vim-vsnip' }                                 -- Snippets
  use {'ellisonleao/glow.nvim'}                               -- Glow(terminal markdown preview)
  use { 'norcalli/nvim-colorizer.lua' }                       -- Colorizer for css
  use({ 
      'iamcco/markdown-preview.nvim',                         -- Mardown preview(browser)
      run = "cd app && npm install",
      setup = function()
      vim.g.mkdp_filetypes =
          { "markdown" }
          end,
      ft = { "markdown" }, 
  })-- }}}


  ----------------------------------------------------------
  --                        Tools                         --
  ----------------------------------------------------------
  -- Nvim-Tree{{{
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
          'kyazdani42/nvim-web-devicons',                     -- optional, for file icons
      },
  }-- }}}
  
  -- Vim Signature(mark suggestions){{{
  use {'kshenoy/vim-signature'}-- }}}

  -- Tree Sitter{{{
  use { 'nvim-treesitter/nvim-treesitter' }-- }}}

  -- Autotag{{{
  use { 'windwp/nvim-ts-autotag' }-- }}}

  -- Rainbow{{{
  use { 'p00f/nvim-ts-rainbow' }-- }}}

  -- Autopairs{{{
  use { 'windwp/nvim-autopairs' }-- }}}

  -- Which-key{{{
  use {'folke/which-key.nvim'}-- }}}

  -- Telescope{{{
  use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = {
          'nvim-lua/plenary.nvim'
    },
  }-- }}}

  -- Nvim Comments{{{
  use { "terrortylor/nvim-comment" }-- }}}

  -- Git-signs{{{
  use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
  }-- }}}

  -- Lastplace{{{
  use "farmergreg/vim-lastplace"-- }}}

  ----------------------------------------------------------
  --                   Extras/Cosmetics                   --
  ----------------------------------------------------------
  -- colorschemes{{{
  -- use { "EdenEast/nightfox.nvim" }
  -- use { 'bluz71/vim-moonfly-colors', branch = 'cterm-compat' }
  use { "ellisonleao/gruvbox.nvim" }
  -- use { 'shaunsingh/oxocarbon.nvim', run = './install.sh' }
  -- use { 'tjdevries/colorbuddy.nvim' }
  -- use {
  --     'taphill/gruvbox.nvim',
  --      config = "require('colorbuddy').colorscheme('gruvbox_nvim')"
  -- }}}}

  -- Staline{{{
  use { 'tamton-aquib/staline.nvim' }-- }}}

  -- Lualine{{{
  -- use {
  --     'nvim-lualine/lualine.nvim',
  --     requires = {
  --         'kyazdani42/nvim-web-devicons',
  --         opt = true,
  --         options = {
  --             theme = 'gruvbox'
  --     }
  --   }
  -- }}}}

  -- Bufferline{{{
  use {
      'akinsho/bufferline.nvim',
      tag = "v2.*",
      requires = 'kyazdani42/nvim-web-devicons'
  }-- }}}

  -- Dashboard{{{
  use { 'glepnir/dashboard-nvim' }-- }}}

  -- Indent-Blankline{{{
  use { "lukas-reineke/indent-blankline.nvim" }-- }}}

  -- Twilight{{{
  -- use { "folke/twilight.nvim" }}}}
  
  -- -- Zen-mode{{{
  -- use { "folke/zen-mode.nvim" }}}}
  
  -- Goyo instead of Zen-mode{{{
  use { "junegunn/goyo.vim" }-- }}}

end)
