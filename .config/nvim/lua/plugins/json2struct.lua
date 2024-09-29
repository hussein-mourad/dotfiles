-- Convert json to go struct
-- Usage: :JSON2Struct [Name]

return {
  "triarius/json2struct.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = true,
  ft = { "go", "templ" },
}
