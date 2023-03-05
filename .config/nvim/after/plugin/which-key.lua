local wk = require("which-key")
local mappings = {
  fs = {":w<CR>", "Save"},
  fsa = {":wall<CR>", "Save"},
  Q = {":q<CR>", "Exit"},
  N = {":tab new<CR>", "New buffer"},
  bp = {":bp<CR>", "Previous buffer"},
  bn = {":bn<CR>", "Next buffer"},
  vs = {":vsplit<CR>", "Vsplit"},
  hs = {":split<CR>", "Hsplit"},
  ff = {":Telescope find_files<CR>", "Find file"},
  fr = {":Telescope live_grep<CR>", "Grep"},
  x = {":bdelete<CR>", "Close"}
}
local opts = {prefix = "<leader>"}
wk.register(mappings, opts)-- }}}
