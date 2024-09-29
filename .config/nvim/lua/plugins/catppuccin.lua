return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      term_colors = true,
      transparent_background = false,
      no_italic = false,
      no_bold = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = "#222222",
          mantle = "#222222",
          crust = "#222222",
        },
      },
      highlight_overrides = {
        mocha = function(C)
          return {
            TabLineSel = { bg = C.pink },
            CmpBorder = { fg = C.surface2 },
            Pmenu = { bg = C.none },
            TelescopeBorder = { link = "FloatBorder" },
          }
        end,
      },
      custom_highlights = function(colors)
        return {
          WinSeparator = { fg = colors.blue, bg = "NONE" }, -- Adjust color to fit Catppuccin theme
        }
      end,
    }
    vim.cmd.colorscheme "catppuccin"
  end,
}
