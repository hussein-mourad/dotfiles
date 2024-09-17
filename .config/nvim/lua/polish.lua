-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.cmd [[
  function OpenMarkdownPreview (url)
    execute "silent ! zen-browser --new-window " . a:url
  endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]]

vim.cmd [[
  augroup i3config
    autocmd!
    autocmd BufRead,BufNewFile ~/dotfiles/.config/i3/* setfiletype i3config
  augroup END
]]

-- vim.api.nvim_del_augroup_by_name "TermMappings"
-- vim.keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Terminal normal mode" })
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], { desc = "Terminal left window navigation" })
-- vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], { desc = "Terminal down window navigation" })
-- vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], { desc = "Terminal up window navigation" })
-- vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], { desc = "Terminal right window naviation" })

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
