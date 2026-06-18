-- Convert json to go struct
-- Usage: :JSON2Struct [Name]
if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "triarius/json2struct.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = true,
  ft = { "go", "templ" },
}
