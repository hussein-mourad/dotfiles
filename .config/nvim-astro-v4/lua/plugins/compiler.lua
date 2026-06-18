-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "Zeioth/compiler.nvim",
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { Overseer = "" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<leader>M"
        maps.n[prefix] = { desc = require("astroui").get_icon("Overseer", 1, true) .. "Overseer" }

        maps.n[prefix .. "t"] = { "<Cmd>CompilerToggleResults<CR>", desc = "Toggle Compiler" }
        maps.n[prefix .. "r"] = { "<Cmd>CompilerOpen<CR>", desc = "Run Task" }
      end,
    },
  },
  cmd = { "CompilerOpen", "CompilerToggleResults" },
  opts = {},
  enabled = false,
}
