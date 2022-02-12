-- Key maps --
local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--  Terminal mode mappings
--  Have <Esc> mapped to intuitiveness
keymap("t", ",q", "<C-\\><C-n>", opts)

--  Normal Mode mappings
keymap("n", "<leader>a", ":Lex 30<CR>", opts)
keymap("n", "<C-h>", ":resize -2<CR>", opts)
keymap("n", "<C-l>", ":resize +2<CR>", opts)
keymap("n", "<C-k>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-j>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-n>", ":noh<CR>", opts)

-- Visual Mode mappings
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
keymap("v", "J",":m '<-2<CR>gv-gv", opts)
keymap("v", "K",":m '>+1<CR>gv-gv", opts)
keymap("v", "p", '"_dP', opts)
keymap("v", "//", "y/\\V<C-R>=escape(@\",'/\')<CR><CR>", opts)

-- Insert Mode mappings
-- Note: Might Use mappings
keymap("i", "(", "()<Left>", opts)
keymap("i", "[", "[]<Left>", opts)
keymap("i", "{", "{}<Left>", opts)
keymap("i", "<", "<><Left>", opts)
keymap("i", "\'", "\'\'<Left>", opts)
keymap("i", "\"", "\"\"<Left>", opts)