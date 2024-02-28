return {
  "pocco81/auto-save.nvim",
  lazy = false,
  opts = {
    vim.api.nvim_set_keymap("n", "<leader>W", ":ASToggle<CR>", { desc = "Toggle auto save" }),
  },
}
