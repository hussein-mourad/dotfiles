return {
  "3rd/image.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup {
          auto_install = true,
          ensure_installed = { "markdown" },
          highlight = { enable = true },
        }
      end,
    },
    {
      "vhyrro/luarocks.nvim",
      priority = 1000, -- this plugin needs to run before anything else
      opts = {
        rocks = { "magick", hererocks = true },
      },
    },
  },
  opts = {
    backend = "ueberzug",
    rocks = {
      hererocks = true,
    },
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = true,
        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
      },
      neorg = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { "norg" },
      },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
    tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
    -- kitty_method = "normal",
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
  },
}
