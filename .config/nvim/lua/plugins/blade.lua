-- Add html tailwind emmet to blade file
return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      opts.config.html = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html", "blade" },
        root_dir = function(fname) return require("lspconfig").util.find_git_ancestor(fname) end,
      }

      if vim.fn.executable "vscode-html-language-server" == 1 then
        opts.servers = require("astrocore").list_insert_unique(opts.servers, { "html" })
      end

      opts.config.tailwindcss = {
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = { "html", "css", "blade" },
        root_dir = function(fname) return require("lspconfig").util.find_git_ancestor(fname) end,
      }

      if vim.fn.executable "tailwindcss-language-server" == 1 then
        opts.servers = require("astrocore").list_insert_unique(opts.servers, { "tailwindcss" })
      end

      opts.config.emmet_ls = {
        cmd = { "emmet-ls", "--stdio" },
        filetypes = { "html", "css", "blade" },
        root_dir = function(fname) return require("lspconfig").util.find_git_ancestor(fname) end,
      }

      if vim.fn.executable "emmet-ls" == 1 then
        opts.servers = require("astrocore").list_insert_unique(opts.servers, { "emmet_ls" })
      end
    end,
  },
}
