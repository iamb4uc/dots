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
  }

  -- Emoji Extension
  use {
    'xiyaowong/telescope-emoji',
    requires = {
      'nvim-telescope/telescope.nvim'
    },
  }

  -- }}}

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
  -- colorschemes
  use { "ellisonleao/gruvbox.nvim" }
  use({
    'NTBBloodbath/doom-one.nvim',
    setup = function()
        -- Add color to cursor
		vim.g.doom_one_cursor_coloring = false
		-- Set :terminal colors
		vim.g.doom_one_terminal_colors = true
		-- Enable italic comments
		vim.g.doom_one_italic_comments = false
		-- Enable TS support
		vim.g.doom_one_enable_treesitter = true
		-- Color whole diagnostic text or only underline
        vim.g.doom_one_diagnostics_text_color = false
		-- Enable transparent background
		vim.g.doom_one_transparent_background = false

        -- Pumblend transparency
		vim.g.doom_one_pumblend_enable = false
		vim.g.doom_one_pumblend_transparency = 20

        -- Plugins integration
		vim.g.doom_one_plugin_neorg = true
		vim.g.doom_one_plugin_barbar = false
		vim.g.doom_one_plugin_telescope = false
		vim.g.doom_one_plugin_neogit = true
		vim.g.doom_one_plugin_nvim_tree = true
		vim.g.doom_one_plugin_dashboard = true
		vim.g.doom_one_plugin_startify = true
		vim.g.doom_one_plugin_whichkey = true
		vim.g.doom_one_plugin_indent_blankline = true
		vim.g.doom_one_plugin_vim_illuminate = true
		vim.g.doom_one_plugin_lspsaga = false
	end,
	config = function()
        vim.cmd("colorscheme doom-one")
    end,
})


  -- Staline{{{
  use { 'tamton-aquib/staline.nvim' }-- }}}

  -- Indent-Blankline{{{
  use { "lukas-reineke/indent-blankline.nvim" }-- }}}

  -- Goyo instead of Zen-mode{{{
  use { "junegunn/goyo.vim" }-- }}}


end)
