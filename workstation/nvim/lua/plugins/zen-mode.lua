-- Lua
return {
  "folke/zen-mode.nvim",
  version = false,
  keys = {
    -- add a keymap to browse plugin files
    -- stylua: ignore
    {
      "<leader>bz",
      function() require("zen-mode").toggle({}) end,
      desc = "Zen Mode",
    },
  },
  config = function()
    require("zen-mode").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
  end,
}
