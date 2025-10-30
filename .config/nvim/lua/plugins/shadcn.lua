-- https://github.com/BibekBhusal0/nvim-shadcn
-- Add shadcn components
-- :ShadcnAdd
return {
  "BibekBhusal0/nvim-shadcn",
  -- "hussein-mourad/nvim-shadcn",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("nvim-shadcn").setup {
      important = { "button", "card" },
    }
  end,
  keys = {
    { "<leader>sa", ":ShadcnAdd<CR>", desc = "Add shadcn component" },
    { "<leader>si", ":ShadcnInit<CR>", desc = "Init shadcn" },
    { "<leader>sI", ":ShadcnAddImportant<CR>", desc = "Add important shadcn component" },
  },
}
