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

-- workaround for broke gqq issue: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1131
local function is_null_ls_formatting_enabed(bufnr)
  local file_type = api.nvim_buf_get_option(bufnr, "filetype")
  local generators =
    require("null-ls.generators").get_available(file_type, require("null-ls.methods").internal.FORMATTING)
  return #generators > 0
end
function on_attach(client, bufnr)
  if server_capabilities.documentFormattingProvider then
    if client.name == "null-ls" and is_null_ls_formatting_enabed(bufnr) or client.name ~= "null-ls" then
      api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
      map("n", "<leader>gq", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
    else
      api.nvim_buf_set_option(bufnr, "formatexpr", "")
    end
  end
end
