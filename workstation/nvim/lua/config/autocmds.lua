-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Enable autoindent for PHP files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.opt_local.autoindent = true -- Enable autoindent for PHP
    vim.opt_local.smartindent = true -- Optionally enable smartindent
    vim.opt_local.tabstop = 4 -- Tab width (adjust if needed)
    vim.opt_local.shiftwidth = 4 -- Indentation width
    vim.opt_local.expandtab = true -- Use spaces instead of tabs
  end,
})
