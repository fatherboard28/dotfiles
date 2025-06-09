vim.g.mapleader = " "
vim.keymap.set("n", "<leader>=", "<cmd>Oil --float<cr>")

vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<cr>")
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<cr>")
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<cr>")
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<cr>")

vim.keymap.set("n", "<leader>bb", "<cmd>e#<cr>")

vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "<C-S-Right>", "<cmd>:vertical resize -1<cr>")
vim.keymap.set("n", "<C-S-Left>", "<cmd>:vertical resize +1<cr>")
vim.keymap.set("n", "<leader>s", "<cmd>SymbolsOutline<cr>")
