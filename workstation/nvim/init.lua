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

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for xdebug Main",
    port = 9003,
    log = true,
    pathMappings = {
      ["/var/www"] = "/home/francis/www/tickettomato.com",
    },
  },
}
