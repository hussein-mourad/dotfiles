if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- configure git-worktree with telescope
return {
  "polarmutex/git-worktree.nvim",
  config = function()
    require("git-worktree").setup()
    require("telescope").load_extension "git_worktree"
    -- vim.keymap.set("n", "<Leader>fd", "<cmd>Telescope git_worktree git_worktrees<CR>")
    -- vim.keymap.set("n", "<Leader>fD", "<cmd>Telescope git_worktree create_git_worktree<CR>")
    vim.keymap.set("n", "<Leader>fd", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
    vim.keymap.set(
      "n",
      "<Leader>gw",
      "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
      { desc = "Create git worktree" }
    )
  end,
}
