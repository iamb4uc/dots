-- -----------
-- Keymaps --
-------------
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Save files
map('n', '<leader>fs', ':w<CR>')
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
map('n', '<C-n>', ':tab new<CR>')

-- Telescope Keybindings
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files)
map('n', '<leader>fg', builtin.live_grep)
map('n', '<leader>fb', builtin.buffers)
map('n', '<leader>ht', ':Telescope colorscheme<CR>')

-- Glow
map('n', '<leader>g', ':Glow<CR>')
map('n', '<leader>G', ':Glow!<CR>')

-- compile stuff by The Tech gent Luke Smith
map('n', '<leader>a', ':! compiler "%:p"<CR><CR>')

-- Clear Latex trash if needed
map('n', '<leader>tc', ':! texclear "%:p"<CR><CR>')

-- Open corresponding .pdf/.html or preview

map('n', '<leader>p', ':! opout "%:p" <CR><CR>')

-- Unga bunga Sync Plugins
map('n', '<leader>hrr', ':PackerClean<CR>y<CR> |: PackerSync<CR>')

-- Open specific files
map('n', '<leader>fP', ':e ~/.config/nvim/<CR>')
map('n', '<leader>fS', ':e ~/.config/zsh/.zshrc<CR>')
