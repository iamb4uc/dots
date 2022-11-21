-- Variables
local A = vim.api
local g   = vim.g
local o   = vim.o
local opt = vim.opt
local cmd = vim.cmd

--------------
-- Settings --
--------------
--------
-- UI --
--------
o.number = true
o.scrolloff = 8
o.sidescrolloff = 8
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
o.termguicolors = true
o.showmode = false
o.showtabline = 2

--------
-- UX --
--------
o.expandtab = true
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
-- o.wrap = true
opt.foldmethod = "marker"

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '


-----------------
-- Tree-sitter --
-----------------
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "markdown", "python", "java", "rust", "html", "css" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil,
  },
  autopairs = {enable = true}
}

require("nvim-autopairs").setup({
  chech_ts = true,
  map_cr = true,
})

---------------
-- NVIM TREE --
---------------
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
    dotfiles = true,
  },
})


------------------------------
-- Lua line and Buffer line --
------------------------------
-- require('lualine').setup({
--     options = { theme = 'gruvbox' }
-- })
require("bufferline").setup{}


---------------
-- Which-Key --
---------------
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
wk.register(mappings, opts)

---------------
-- Telescope --
---------------
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

--------------------------------
-- nvim-cmp (code completion) --
--------------------------------
local cmp = require'cmp'
local lspkind = require('lspkind')
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

vim.g.completeopt = "menu,menuone,noselect,noinsert"
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
})

local lsp_installer = require('nvim-lsp-installer')

lsp_installer.on_server_ready(function(server)
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol
                                                                       .make_client_capabilities())
  local opts = {capabilities = capabilities}
  if server.name == "sumneko_lua" then
    opts = vim.tbl_deep_extend("force", {
      settings = {
        Lua = {
          runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
          diagnostics = {globals = {'vim'}},
          workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
          telemetry = {enable = false}
        }
      }

    }, opts)
  end
  server:setup(opts)
end)


-------------------
-- Colorizer.lua --
-------------------
require'colorizer'.setup()


---------------
-- Dashboard --
---------------
local db = require('dashboard')
local home = os.getenv('HOME')

db.default_executive = 'telescope'
db.default_banner = {
[[ =================     ===============     ===============   ========  ======== ]],
[[ \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . // ]],
[[ ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .|| ]],
[[ || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . || ]],
[[ ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .|| ]],
[[ || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . || ]],
[[ ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .|| ]],
[[ || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . || ]],
[[ ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.|| ]],
[[ ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `|| ]],
[[ ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   || ]],
[[ ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   || ]],
[[ ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   || ]],
[[ ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   || ]],
[[ ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   || ]],
[[ ||.=='    _-'                                                     `' |  /==.|| ]],
[[ =='    _-'                        N E O V I M                         \/   `== ]],
[[ \   _-'                                                                `-_   / ]],
[[  `''                                                                      `''  ]],
[[                                                                                ]],
}

db.custom_center = {
    {icon = '  ',
    desc = 'Find recent files                       ',
    action = 'Telescope oldfiles',
    shortcut = 'SPC f r'},
    {icon = '  ',
    desc = 'Find files                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f f'},
    {icon = '  ',
    desc = 'Find word                               ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f w'},
    {icon = '  ',
    desc = 'Load new theme                          ',
    action = 'Telescope colorscheme',
    shortcut = 'SPC h t'},
}

db.custom_footer = {'Life is too short to run proprietary software. - Bdale Garbee'}



-----------------
-- Indent-line --
-----------------
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
}


--------------------
-- Comment config --
--------------------
require('nvim_comment').setup({
  line_mapping = "<leader>cl",
  operator_mapping = "<leader>c",
  comment_empty = false
})


---------------------
-- Twilight config --
---------------------
require("twilight").setup {
  {
    dimming = {alpha = 0.25, color = {"Normal", "#ffffff"}, inactive = true},
    context = 10,
    treesitter = true,
    expand = {"function", "method", "table", "if_statement"}
  }
}

--------------
-- Zen-mode --
--------------
require("zen-mode").setup {
  window = {
    backdrop = 0.95,
    width = 100,
    height = 1.0,
    options = {signcolumn = "no", number = false, cursorline = false}
  },
  plugins = {
    options = {enabled = true, ruler = false, showcmd = false},
    twilight = {enabled = true},
    gitsigns = {enabled = false},
    tmux = {enabled = false}
  }
}

-----------------
-- Colorscheme --
-----------------
-- cmd("colorscheme nordfox")
-- cmd("colorscheme moonfly")

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
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
cmd("colorscheme gruvbox")

-------------
-- Staline --
-------------
require('staline').setup {
    defaults = {
        expand_null_ls = false,  -- This expands out all the null-ls sources to be shown
        left_separator  = "",
        right_separator = "",
        full_path       = false,
        line_column     = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.

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
        n = "#2bbb4f",
        i = "#986fec",
        c = "#e27d60",
        v = "#4799eb",   -- etc..
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
}

--------------
-- Stabline --
--------------
-- require('stabline').setup {
-- 	style       = "bar", -- others: arrow, slant, bubble
-- 	stab_left   = "┃",
-- 	stab_right  = " ",
-- 
-- 	-- fg          = Default is fg of "Normal".
-- 	-- bg          = Default is bg of "Normal".
-- 	inactive_bg = "#1e2127",
-- 	inactive_fg = "#aaaaaa",
-- 	-- stab_bg     = Default is darker version of bg.,
-- 
-- 	font_active = "bold",
-- 	exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
-- 	stab_start  = "",   -- The starting of stabline
-- 	stab_end    = "",
-- }
