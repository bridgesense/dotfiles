-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local dap = require("dap")
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = {
    "/home/francis/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js",
  },
}

-- the json equivalent of this is can be placed in a .vscode/launch.json file.
-- see an example here: https://github.com/bridgesense/lampready#dap-mode-for-emacs
-- dap.configurations.php = {
--   {
--     type = "php",
--     request = "launch",
--     name = "Listen for xdebug Main",
--     port = 9003,
--     log = true,
--     pathMappings = {
--       ["/var/www"] = "/path/to/your/project/root",
--     },
--   },
-- }
