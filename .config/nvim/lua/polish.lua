-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.cmd [[
  function OpenMarkdownPreview (url)
    execute "silent ! chromium --new-window " . a:url
  endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]]

vim.cmd [[
  augroup i3config
    autocmd!
    autocmd BufRead,BufNewFile ~/dotfiles/.config/i3/* setfiletype i3config
  augroup END
]]

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
