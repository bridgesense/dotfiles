return {
  "akinsho/org-bullets.nvim",
  version = false,
  dependencies = {
    "nvim-orgmode/orgmode",
  },
  init = function()
    -- init.lua

    require("org-bullets").setup({})
  end,
}
