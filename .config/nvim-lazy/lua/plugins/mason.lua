return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "black",
        "stylua",
        "shellcheck",
        "shfmt",
        "lua-language-server",
        "html-lsp",
        "css-lsp",
        "stylua",
        "prettier",
        "eslint_d",
        "typescript-language-server",
        "tailwindcss-language-server",
        "pyright",
        "isort",
        "black",
        "pylint",
        -- "python-lsp-server",
        "gopls",
      })
    end,
  },
}
