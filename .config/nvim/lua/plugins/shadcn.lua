-- https://github.com/BibekBhusal0/nvim-shadcn
-- Add shadcn components
-- :ShadcnAdd
return {
  -- "BibekBhusal0/nvim-shadcn",
  "hussein-mourad/nvim-shadcn",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("nvim-shadcn").setup {
      -- Configuration options here
    }
  end,
}
