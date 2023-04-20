-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- the following settins assume you've installed the vscode-debug-php adapter using mason.nvim
local dap = require("dap")
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = {
    vim.loop.os_homedir() .. "/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js",
  },
}
require("dap.ext.vscode").load_launchjs(vim.fn.getcwd() .. "/.vscode/launch.json", {})
-- place your luanch.json script in the root of your project: .vscode/launch.json file.
-- Here's a sample of of launch.json file you might use:
-- {
-- 	"version": "0.2.0",
-- 	"configurations": [
-- 		{
-- 			"name": "Use custom launch.json script",
-- 			"type": "php",
-- 			"request": "launch",
-- 			"port": 9003,
-- 			"pathMappings": {
-- 				"/var/www": "/home/username/your-porject-folder
-- 			},
-- 			"sourchMaps": true,
-- 			"log": false
-- 		}
-- 	]
-- }
