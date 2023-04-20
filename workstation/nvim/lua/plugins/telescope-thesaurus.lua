return {
  "rafi/telescope-thesaurus.nvim",
  version = false,
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    { "<leader>kt", "<cmd>Telescope thesaurus lookup<CR>", desc = "Thesaurus" },
  },
}
