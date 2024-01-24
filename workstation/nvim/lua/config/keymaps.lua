-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Resume previous telescope search
vim.api.nvim_set_keymap("n", "<leader>r", ":Telescope resume<CR>", { noremap = true, silent = true })
