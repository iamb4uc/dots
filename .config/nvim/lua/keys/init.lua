local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<leader>fs', ':w<CR>')
map('n', '<leader>fsa', ':wall<CR>')
map('n', '<leader>qq', ':q<CR>')
map('n', '<leader>Qq', ':q!<CR>')
map('n', '<leader>fsq',':wq<CR>')
map('n', '<leader>bp', ':bp<CR>')
map('n', '<leader>bn', ':bn<CR>')


-- Tab splits
map('n', '<leader>vs', ':vsplit<CR>')
map('n', '<leader>hs', ':split<CR>')
map('n', '<leader>sc', '<C-w><C-c>')
map('n', '<leader>l', '<C-w>l')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>h', '<C-w>h')

-- Netrw
map('n', '<leader>n', ':Ex<CR>')

-- ZenMode
map('n', '<leader>z', ':ZenMode<CR>')

-- Telescope Keybindings
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files)
map('n', '<leader>fg', builtin.live_grep)
map('n', '<leader>fb', builtin.buffers)
map('n', '<leader>fo', builtin.oldfiles)
map('n', '<leader>ht', builtin.colorscheme)

-- compiler stuff by The Tech gent Luke Smith
map('n', '<leader>a', ':! compiler "%:p"<CR><CR>')

-- Insert into empty space
map('n', '<leader><leader>', ':keepp /<++><CR>')

-- Open corresponding .pdf/.html or preview
map('n', '<leader>p', ':! opout "%:p" <CR><CR>')

-- Open specific files
map('n', '<leader>fP', ':e ~/.config/nvim/<CR>')
map('n', '<leader>fS', ':e ~/.config/zsh/.zshrc<CR>')
map('n', '<leader>hrr', ':PackerSync<CR>')

map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')
map('n', '<leader>y', '\'+y')
map('n', '<leader>Y', '\'+Y')
map('v', '<leader>y', '\'+y')
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
