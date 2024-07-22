return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  version = false,
  ft = { "org" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  init = function()
    -- Treesitter configuration
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "org" }, -- Or run :TSUpdate org
    })

    require("orgmode").setup({
      org_agenda_files = { "~/org/*" },
      org_default_notes_file = "~/org/refile.org",
    })
  end,
}
