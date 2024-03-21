-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- ["<leader>s"] = { ":w! <Enter>", "Save File" },
    ["<C-d>"] = { "<C-d>zz", desc = "Center the cursor after motion" },
    ["<C-u>"] = { "<C-u>zz", desc = "Center the cursor after motion" },
    ["n"] = { "nzzzv", desc = "Center the cursor after search" },
    ["N"] = { "Nzzzv", desc = "Center the cursor after search" },
    ["="] = { "<C-a>", desc = "Increment" },
    ["-"] = { "<C-x>", desc = "Decrement" },
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>ga"] = { "<cmd>AerialToggle<cr>", desc = "Toggle code outline" },
    ["!"] = {
      function()
        -- Toggle boolean value
        local word = vim.fn.expand "<cword>"
        local toggle_map = {
          ["true"] = "false",
          ["false"] = "true",
          ["True"] = "False",
          ["False"] = "True",
          ["1"] = "0",
          ["0"] = "1",
        }
        if toggle_map[word] == nil then return end
        local new_word = toggle_map[word]
        vim.api.nvim_feedkeys("ciw" .. new_word, "n", true)
        local key = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
        vim.api.nvim_feedkeys(key, "n", true)
      end,
      desc = "invert current word",
    },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
