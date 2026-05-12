vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- 検索ハイライト解除
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- ウィンドウ移動
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
