-------------
-- Keymaps --
-------------
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', ':update<CR>')
map('n', '<leader>wq',':wq<CR>')
map('n', '<leader>W', ':wall<CR>')

-- Quit neovim
map('n', '<leader>Q', ':q<CR>')

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

-- nvim tree settings
map('n', '<C-f>', ':NvimTreeFocus<CR>')
map('n', '<C-t>', ':NvimTreeToggle<CR>')
-- Fuzzy finder keybinding
map('n', '<leader>o', ':FZF<CR>')

-- New tabe finder
map('n', '<C-n>', ':tab new<CR>')

-- Telescope Keybindings
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fr', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope file_browser<CR>')
map('n', '<leader>ht', ':Telescope colorscheme<CR>')

-- Glow
map('n', '<leader>g', ':Glow<CR>')
map('n', '<leader>G', ':Glow!<CR>')


-- compile Latex
map('n', '<leader>C', ':! pdflatex "%:p"<CR><CR>')

-- Open corresponding .pdf/.html or preview

map('n', '<leader>p', ':! mupdf-x11 $(echo % | sed \'s/tex$/pdf/\') & disown<CR><CR>')
