-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center the cursor after motion down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center the cursor after motion up" })
keymap.set("n", "<leader>fs", ":w! <Enter>", { desc = "Save file" })
keymap.set("n", "n", "nzzzv", { desc = "Center the cursor after search" })
keymap.set("n", "N", "Nzzzv", { desc = "Center the cursor after search" })

keymap.set("i", "jk", "<Esc>", { desc = "Escape insert mode" })
keymap.set("i", "jj", "<Esc>", { desc = "Escape insert mode" })
keymap.set("i", "hh", "<Esc>", { desc = "Escape insert mode" })
keymap.set("i", "kk", "<Esc>", { desc = "Escape insert mode" })
keymap.set("i", "ll", "<Esc>", { desc = "Escape insert mode" })
--   ['<leader>u'] = { vim.cmd.UndotreeToggle, "undo tree" }
