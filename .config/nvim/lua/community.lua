-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- import/override with your plugins folder
  -- { import = "astrocommunity.recipes.vscode" },

  -- colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  -- langs
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },

  -- web dev
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.blade" },
  { import = "astrocommunity.pack.laravel" },
  { import = "astrocommunity.pack.prisma" },
  -- { import = "astrocommunity.pack.sql" },

  -- config files
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },

  -- writing
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.pack.markdown" },

  -- { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.markdown-and-latex.peek-nvim" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },

  -- note-taking
  -- { import = "astrocommunity.note-taking.neorg" },

  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.undotree" },
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  { import = "astrocommunity.editing-support.true-zen-nvim" },
  { import = "astrocommunity.editing-support.nvim-origami" },
  { import = "astrocommunity.editing-support.bigfile-nvim" },
  { import = "astrocommunity.editing-support.dial-nvim" },
  { import = "astrocommunity.editing-support.vim-doge" },

  -- motion
  { import = "astrocommunity.motion.mini-surround" },

  -- fuzzy-finder
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },

  -- remote-development
  { import = "astrocommunity.remote-development.netman-nvim" },

  -- media
  -- { import = "astrocommunity.media.image-nvim" },
  { import = "astrocommunity.media.codesnap-nvim" },

  -- completion
  -- { import = "astrocommunity.completion.copilot-lua" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- utility
  { import = "astrocommunity.utility.nvim-toggler" },

  -- terminal-integration
  { import = "astrocommunity.terminal-integration.vim-tmux-yank" },
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },

  { import = "astrocommunity.register.nvim-neoclip-lua" },

  { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },
  { import = "astrocommunity.file-explorer.oil-nvim" },

  { import = "astrocommunity.git.diffview-nvim" },

  { import = "astrocommunity.keybinding.nvcheatsheet-nvim" },

  { import = "astrocommunity.search.nvim-spectre" },

  -- { import = "astrocommunity.motion.harpoon" },
  -- { import = "astrocommunity.programming-language-support.rest-nvim" },
  { import = "astrocommunity.game.leetcode-nvim" },
}
