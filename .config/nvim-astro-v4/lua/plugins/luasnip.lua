return {
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    -- include the default astronvim config that calls the setup call
    require "astronvim.plugins.configs.luasnip"(plugin, opts)
    -- :help luasnip.txt
    local ls = require "luasnip"
    ls.filetype_extend("javascript", { "javascriptreact" })
    -- load snippets paths
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = { vim.fn.stdpath "config" .. "/snippets" },
    }
  end,
}
