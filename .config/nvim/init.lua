-- ____________________  _______________ ______  __________
-- ____  _/__    |__   |/  /__  __ )_  // /_  / / /_  ____/
--  __  / __  /| |_  /|_/ /__  __  |  // /_  / / /_  /     
-- __/ /  _  ___ |  /  / / _  /_/ //__  __/ /_/ / / /___   
-- /___/  /_/  |_/_/  /_/  /_____/   /_/  \____/  \____/   
-- A simple single file neovim config
-- github.com/imab4uc for more software

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

-- Plugins {{{
require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- LSP Configuration & Plugins
  use { 
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }
  -- Autocompletion
  use { 
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }
   -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  -- Additional text objects via treesitter
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use 'lewis6991/gitsigns.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'tamton-aquib/staline.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'numToStr/Comment.nvim'

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Nvim-Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  }

  -- Which key
  use 'folke/which-key.nvim'

end)
-- }}}
--
-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})


-- Settings and Configs {{{
local A = vim.api
local g   = vim.g
local o   = vim.o
local opt = vim.opt
local cmd = vim.cmd

-- SETTINGS {{{

-- UI{{{
o.number = true
o.scrolloff = 8
o.sidescrolloff = 8
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = false
o.termguicolors = true
o.showmode = false
o.background= "dark"
o.showtabline = 2-- }}}

-- UX {{{
o.expandtab = true
o.hlsearch = false
o.undofile = true
o.breakindent = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = false
o.hidden = true
o.textwidth = 300
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.autoindent = true
o.expandtab = true
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
o.clipboard = 'unnamedplus'
o.timeoutlen = 500
o.updatetime = 200
o.ignorecase = true
o.smartcase = true
o.history = 50
o.splitright = true
o.splitbelow = true
opt.mouse = "a"
o.wrap = false
opt.foldmethod = "marker"
-- }}}

-- Map <leader> to space{{{
g.mapleader = ' '
g.maplocalleader = ' '
-- }}}}}}

-- PROGRAM Configs {{{
-- Enable comment.nvim {{{
require('Comment').setup()
-- }}}
-- Tree shitter {{{
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'latex', 'help', 'vim' },

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
} -- }}}

local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Turn on lsp status information
require('fidget').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- NVIM TREE{{{

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})-- }}}

-- Which-Key {{{
local wk = require("which-key")
local mappings = {
  w = {":w<CR>", "Save"},
  W = {":wall<CR>", "Save"},
  wq = {":wq<CR>", "Save & Quit"},
  Q = {":q<CR>", "Exit"},
  N = {":tab new<CR>", "New buffer"},
  bp = {":bp<CR>", "Previous buffer"},
  bn = {":bn<CR>", "Next buffer"},
  vs = {":vsplit<CR>", "Vsplit"},
  hs = {":split<CR>", "Hsplit"},
  f = {":Telescope find_files<CR>", "Find file"},
  r = {":Telescope live_grep<CR>", "Grep"},
  o = {":FZF<CR>", "Fuzzy Finder"},
  x = {":bdelete<CR>", "Close"}
}
local opts = {prefix = "<leader>"}
wk.register(mappings, opts)-- }}}

-- Telescope{{{
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    layout_config = {
      width = 0.75,
      prompt_position = "top",
      preview_cutoff = 120,
      horizontal = {mirror = false},
      vertical = {mirror = false}
    },
    find_command = {
      'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
    },
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
      }
    }
  }
}
pcall(require('telescope').load_extension, 'fzf')
-- }}}

-- Indent-line{{{
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    -- char = "|",
    buftype_exclude = { "terminal" },
    filetype_exclude = { "dashboard", "NvimTree", "packer" },
    show_current_context = true,
    context_patterns = {
    "class", "return", "function", "method", "^if", "^while", "jsx_element", "^for", "^object",
    "^table", "block", "arguments", "if_statement", "else_clause", "jsx_element",
    "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement",
    "operation_type"
  }
}-- }}}

-- Colorscheme{{{
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
cmd("colorscheme gruvbox")


-- Staline{{{
require('staline').setup {
    defaults = {
        expand_null_ls = false,  -- This expands out all the null-ls sources to be shown
        left_separator  = "",
        right_separator = "",
        full_path       = false,
        line_column     = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.

        fg              = "#000000",  -- Foreground text color.
        bg              = "none",     -- Default background is transparent.
        inactive_color  = "#303030",
        inactive_bgcolor = "none",
        true_colors     = false,      -- true lsp colors.
        font_active     = "none",     -- "bold", "italic", "bold,italic", etc

        mod_symbol      = "  ",
        lsp_client_symbol = " ",
        branch_symbol   = " ",
        cool_symbol     = " ",       -- Change this to override default OS icon.
        null_ls_symbol = "",          -- A symbol to indicate that a source is coming from null-ls
    },
    mode_colors = {
        n = "#b8bb26",
        i = "#d3869b",
        c = "#fb4934",
        v = "#fabd2f",   -- etc..
    },
    mode_icons = {
        n = " ",
        i = " ",
        c = " ",
        v = " ",   -- etc..
    },
    sections = {
        left = { '- ', '-mode', 'left_sep_double', ' ', 'branch' },
        mid  = { 'file_name' },
        right = { 'cool_symbol','right_sep_double', '-line_column' },
    },
    special_table = {
        NvimTree = { 'NvimTree', ' ' },
        packer = { 'Packer',' ' },        -- etc
    },
    lsp_symbols = {
        Error=" ",
        Info=" ",
        Warn=" ",
        Hint="",
    },
}-- }}}

-- }}}
-- }}}
-- }}}


-- Keybindings {{{
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Save files
map('n', '<leader>ww', ':w<CR>')
map('n', '<leader>W', ':wall<CR>')

-- Quite
map('n', '<leader>qq', ':q<CR>')
map('n', '<leader>Qq', ':q!<CR>')

-- Save and quite
map('n', '<leader>wq',':wq<CR>')

-- Move to the next/previous buffer
map('n', '<leader>bp', ':bp<CR>')
map('n', '<leader>bn', ':bn<CR>')


-- Tab splits
map('n', '<leader>vs', ':vsplit<CR>')
map('n', '<leader>hs', ':split<CR>')
map('n', '<leader>l', '<C-w>l')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>h', '<C-w>h')

-- Nvim Tree
map('n', '<leader>n', ':NvimTreeToggle<CR>')

-- Goyo
map('n', '<leader>zz', ':Goyo 70%x95%<CR>')
map('n', '<leader>zx', ':Goyo!<CR>')

-- New tab finder
map('n', '<C-t>', ':tab new<CR>')

-- Telescope Keybindings
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files)
map('n', '<leader>fg', builtin.live_grep)
map('n', '<leader>fb', builtin.buffers)
map('n', '<leader>fo', builtin.oldfiles)
map('n', '<leader>ht', ':Telescope colorscheme<CR>')

-- compiler stuff by The Tech gent Luke Smith
map('n', '<leader>a', ':! compiler "%:p"<CR><CR>')

-- Open corresponding .pdf/.html or preview
map('n', '<leader>p', ':! opout "%:p" <CR><CR>')

-- Open specific files
map('n', '<leader>fP', ':e ~/.config/nvim/<CR>')
map('n', '<leader>fS', ':e ~/.config/zsh/.zshrc<CR>')

-- }}}
