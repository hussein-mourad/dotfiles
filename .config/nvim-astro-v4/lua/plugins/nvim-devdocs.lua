if false then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local prefix = "<Leader>f"

return {
  "warpaint9299/nvim-devdocs",
  opts = {
    previewer_cmd = vim.fn.executable "glow" == 1 and "glow" or nil,
    cmd_args = { "-s", "dark", "-w", "120" },
  },
  keys = {
    { prefix .. "di", "<Cmd>DevdocsInstall<CR>", desc = "Install Devdocs docs", mode = { "n" } },
    { prefix .. "dd", "<Cmd>DevdocsOpenCurrentFloat<CR>", desc = "Find Devdocs for current file", mode = { "n" } },
    { prefix .. "dt", "<Cmd>DevdocsToggle<CR>", desc = "Toggle last Devdocs item", mode = { "n" } },
    { prefix .. "D", "<Cmd>DevdocsOpenFloat<CR>", desc = "Find Devdocs", mode = { "n" } },
  },
}
