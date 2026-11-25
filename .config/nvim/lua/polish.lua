-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.cmd [[
  function OpenMarkdownPreview (url)
    execute "silent ! firefox --new-window " . a:url
  endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]]

vim.cmd [[
  augroup i3config
    autocmd!
    autocmd BufRead,BufNewFile ~/dotfiles/.config/i3/* setfiletype i3config
  augroup END
]]

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*/routeTree.gen.ts", "*.lock" },
  callback = function()
    vim.bo.readonly = true
    vim.bo.modifiable = false
  end,
})
--
-- vim.api.nvim_del_augroup_by_name "TermMappings"
-- vim.keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Terminal normal mode" })
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], { desc = "Terminal left window navigation" })
-- vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], { desc = "Terminal down window navigation" })
-- vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], { desc = "Terminal up window navigation" })
-- vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], { desc = "Terminal right window naviation" })

-- require("lspconfig").arduino_language_server.setup {
--   cmd = {
--     "arduino-language-server",
--     "-clangd",
--     "/home/hussein/.local/share/nvim/mason/bin/clangd",
--     "-cli",
--     "/usr/bin/arduino-cli",
--     "-cli-config",
--     "/home/hussein/.arduino15/arduino-cli.yaml",
--     "-fqbn",
--     "esp8266:esp8266:nodemcuv2",
--   },
-- }

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

-- angularls also answers documentSymbol for .ts files but returns only the class, and aerial
-- may pick it over vtsls (the outline then misses DTO fields). Let vtsls own symbols.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "angularls" then client.server_capabilities.documentSymbolProvider = false end
  end,
})
