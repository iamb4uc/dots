-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<leader>fs", ":w<CR>")
map("n", "<leader>fsa", ":wall<CR>")
map("n", "<leader>qq", ":q<CR>")
map("n", "<leader>Qq", ":q!<CR>")
map("n", "<leader>fsq", ":wq<CR>")

-- Tab splits
map("n", "<leader>vs", ":vsplit<CR>")
map("n", "<leader>hs", ":split<CR>")
map("n", "<leader>sc", "<C-w><C-c>")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>h", "<C-w>h")

-- Netrw
map("n", "<leader>n", ":Ex<CR>")

-- ZenMode
map("n", "<leader>z", ":ZenMode<CR>")

-- compiler stuff by The Tech gent Luke Smith
map("n", "<leader>a", ':! compiler "%:p"<CR><CR>')

-- Insert into empty space
map("n", "<leader><leader>", ":keepp /<++><CR>")

-- Open corresponding .pdf/.html or preview
map("n", "<leader>p", ':! opout "%:p" <CR><CR>')

-- Open specific files
map("n", "<leader>oc", ":e ~/.config/nvim/<CR>")
map("n", "<leader>sc", ":e ~/.config/zsh/.zshrc<CR>")
map("n", "<leader>hrr", ":PackerSync<CR>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<leader>y", "'+y")
map("n", "<leader>Y", "'+Y")
map("v", "<leader>y", "'+y")
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
