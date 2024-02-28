local opts = require "plugins.configs.treesitter"
opts.ensure_installed = {
  "lua",
  "vim",
  "html",
  "css",
  "javascript",
  "typescript",
  "tsx",
  "json",
  "python",
  "bash",
  "c"
}
return opts
