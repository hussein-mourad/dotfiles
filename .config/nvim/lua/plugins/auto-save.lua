-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "pocco81/auto-save.nvim",
  lazy = false,
  opts = {
    -- vim.api.nvim_set_keymap("n", "<leader>W", ":ASToggle<CR>", { desc = "Toggle auto save" }),
  },
  enabled = false,
  write_all_buffers = false, -- write all buffers when the current one meets `condition`
  cleaning_interval = 100, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
  debounce_delay = 150, -- saves the file at most every `debounce_delay` milliseconds
  -- trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
  trigger_events = { "InsertLeave" }, -- vim events that trigger auto-save. See :h events
}
