local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>f", ":NvimTreeFindFileToggle<cr>", opts)
keymap("n", "<leader>/", ":Commentary<cr>", opts)
keymap("v", "<leader>/", ":Commentary<cr>", opts)
keymap("n", "<leader>tc", ":Telescope colorscheme<cr>", opts)
keymap("n", "<leader>tf", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>s", ":Startify<cr>", opts)
