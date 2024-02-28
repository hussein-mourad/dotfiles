local M = {}

M.abc = {
  n = {
    ["<leader>s"] = { ":w! <Enter>", "Save File" },
    ["<C-d>"] = { "<C-d>zz", "Center the cursor after motion" },
    ["<C-u>"] = { "<C-u>zz", "Center the cursor after motion" },
    ["n"] = { "nzzzv", "Center the cursor after search" },
    ["N"] = { "Nzzzv", "Center the cursor after search" },
    ['<leader>u'] = { vim.cmd.UndotreeToggle, "undo tree" }
  },

  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  }
}

-- M.dap = {
--   plugin = true,
--   n = {
--     ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
--   }
-- }
--
-- M.dap_python = {
--   plugin = true,
--   n = {
--     ["<leader>dpr"] = {
--       function()
--         require('dap-python')
--       end
--     }
--   }
-- }

return M
