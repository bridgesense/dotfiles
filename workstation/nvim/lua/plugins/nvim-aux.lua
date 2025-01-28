return {
  -- default mason loads
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "intelephense",
        "php-debug-adapter",
      },
    },
  },

  -- add more treesitter parsers and configure specific indentation
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "query",
        "regex",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      indent = { enable = false }, -- Turn off Treesitter's indentation
    },
  },

  -- php dap debugger
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { path .. "/extension/out/phpDebug.js" },
      }
    end,
  },

  -- place your luanch.json script in the root of your project: .vscode/launch.json file.
  -- Here's a sample of of launch.json file you might use:
  -- {
  -- "version": "0.2.0",
  -- "configurations": [
  -- {
  -- "name": "Use custom launch.json script",
  -- "type": "php",
  -- "request": "launch",
  -- "port": 9003,
  -- "pathMappings": {
  -- "/var/www": "/home/username/your-porject-folder
  -- },
  -- "sourchMaps": true,
  -- "log": false
  -- }
}
