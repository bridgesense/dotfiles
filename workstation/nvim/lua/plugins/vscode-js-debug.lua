return {
  -- Add nvim-dap-vscode-js and its dependency
  {
    "mxsdev/nvim-dap-vscode-js",
    requires = { "mfussenegger/nvim-dap" },
  },

  -- Add and configure vscode-js-debug
  {
    "microsoft/vscode-js-debug",
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  },

  -- Include any other plugins here
}
