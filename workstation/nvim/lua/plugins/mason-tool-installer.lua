return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",

  opts = {
    { "grammarly-languageserver", auto_update = true },
    { "intelephense", auto_update = true },
    { "php-debug-adapter", auto_update = true },
    auto_update = true,
    run_on_start = true,
    start_delay = 3000,
    debounce_hours = 5,
  },
}
