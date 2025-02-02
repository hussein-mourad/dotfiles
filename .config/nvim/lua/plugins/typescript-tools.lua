if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- INFO: make sure typescript-styled-plugin is installed
-- npm i -g @styled/typescript-styled-plugin

return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  -- build = function()
  --   local package_manager = vim.fn.executable "npm" or false
  --   if not package_manager then error "Missing `npm` in the PATH" end
  --   local cmd = "npm i -g @styled/typescript-styled-plugin"
  --   vim.cmd(cmd)
  -- end,
  opts = {
    settings = {
      tsserver_plugins = {
        "@styled/typescript-styled-plugin",
      },
    },
  },
}
