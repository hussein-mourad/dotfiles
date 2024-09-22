if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "pocco81/auto-save.nvim",
  lazy = false,
  opts = {
    vim.api.nvim_set_keymap("n", "<leader>W", ":ASToggle<CR>", { desc = "Toggle auto save" }),
  },
  enabled = false,
  write_all_buffers = false, -- write all buffers when the current one meets `condition`
  debounce_delay = 1500, -- saves the file at most every `debounce_delay` milliseconds
  -- trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
}
