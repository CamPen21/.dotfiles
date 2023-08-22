-- Set mapleader
vim.g.mapleader = ","
-- Move line up and down on visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
-- Center the line to the middle on half page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center the searched term
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Paste without saving deleted value
vim.keymap.set("n", "<leader>p", "\"_dP")

-- Copy to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Deleting without saving deleted value
vim.keymap.set({"n","v"},  "<leader>d", "\"_d")

-- Don't press Q?
vim.keymap.set("v", "Q", "<nop>")
