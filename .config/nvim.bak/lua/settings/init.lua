local opt = vim.opt
local g = vim.g

opt.number = true
opt.scrolloff = 16
opt.sidescrolloff = 16
opt.numberwidth = 2
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.cursorline = false
opt.termguicolors = true
opt.showmode = false
opt.background= "dark"
opt.showtabline = 2
opt.expandtab = true
opt.hlsearch = false
opt.undofile = true
opt.breakindent = true
opt.smarttab = true
opt.cindent = true
opt.autoindent = true
opt.wrap = false
opt.hidden = true
opt.textwidth = 300
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.expandtab = true
opt.list = true
opt.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
opt.clipboard = 'unnamedplus'
opt.timeoutlen = 500
opt.updatetime = 200
opt.ignorecase = true
opt.smartcase = true
opt.history = 50
opt.splitright = true
opt.splitbelow = true
opt.mouse = "a"
opt.wrap = false
opt.foldmethod = "marker"
opt.scl = "auto"

g.mapleader = ' '
g.maplocalleader = ' '
g.vimwiki_folding = 'custom'
-- g.loaded_netrw = 1
-- g.loaded_netrwPlugin = 1

vim.api.nvim_set_hl(0, 'SignColumn', { clear })

