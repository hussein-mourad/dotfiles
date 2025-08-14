-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- import/override with your plugins folder

  -- colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- langs
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.python-ruff" },
  -- { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.pack.rust" },

  -- web dev
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.tailwindcss" },
  -- { import = "astrocommunity.pack.php" },
  -- { import = "astrocommunity.pack.blade" },
  -- { import = "astrocommunity.pack.laravel" },
  -- { import = "astrocommunity.pack.prisma" },
  -- { import = "astrocommunity.pack.templ" },
  -- { import = "astrocommunity.pack.vue" },
  -- { import = "astrocommunity.pack.sql" },

  -- devops
  -- { import = "astrocommunity.pack.terraform" },
  -- { import = "astrocommunity.pack.ansible" },

  -- config files
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },

  -- writing
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.pack.markdown" },

  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.markdown-and-latex.peek-nvim" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },

  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  -- { import = "astrocommunity.editing-support.true-zen-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.undotree" },
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  { import = "astrocommunity.editing-support.nvim-origami" }, -- easy folding
  { import = "astrocommunity.editing-support.bigfile-nvim" },
  { import = "astrocommunity.editing-support.dial-nvim" }, -- increment/decrement
  { import = "astrocommunity.editing-support.neogen" }, -- documentation generation
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  -- { import = "astrocommunity.editing-support.cloak-nvim" }, -- hide .env variables
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.editing-support.conform-nvim" }, -- formatting
  { import = "astrocommunity.editing-support.refactoring-nvim" }, -- formatting
  { import = "astrocommunity.editing-support.suda-vim" }, -- sudo support
  { import = "astrocommunity.editing-support.text-case-nvim" }, -- sudo support
  { import = "astrocommunity.editing-support.nvim-treesitter-context" }, -- sticks current function signature at the top of the page
  { import = "astrocommunity.editing-support.nvim-regexplainer" }, -- explain regex
  -- { import = "astrocommunity.editing-support.copilotchat-nvim" }, -- copilot chat

  -- motion
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.marks-nvim" },

  -- scrolling --
  -- Smooth scrolling for window movement commands (mappings optional): <C-u>, <C-d>, <C-b>, <C-f>, <C-y>, <C-e>, zt, zz, zb.
  -- { import = "astrocommunity.scrolling.neoscroll-nvim" },

  -- fuzzy-finder
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },

  -- remote-development
  { import = "astrocommunity.remote-development.netman-nvim" },

  -- media
  -- { import = "astrocommunity.media.image-nvim" },
  { import = "astrocommunity.media.codesnap-nvim" },

  -- completion
  { import = "astrocommunity.completion.cmp-calc" },
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.completion.cmp-emoji" },
  { import = "astrocommunity.completion.cmp-git" },
  { import = "astrocommunity.completion.cmp-nerdfont" },
  { import = "astrocommunity.completion.cmp-spell" },
  -- { import = "astrocommunity.completion.copilot-lua" },
  -- { import = "astrocommunity.completion.copilot-cmp" }, -- copilot
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.completion.supermaven-nvim" },
  -- { import = "astrocommunity.completion.fittencode-nvim" },

  -- quickfix menu
  { import = "astrocommunity.quickfix.nvim-bqf" },

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

  { import = "astrocommunity.lsp.ts-error-translator-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },

  { import = "astrocommunity.docker.lazydocker" },

  { import = "astrocommunity.code-runner.overseer-nvim" },
  -- { import = "astrocommunity.code-runner.compiler-nvim" },

  -- { import = "astrocommunity.programming-language-support.rest-nvim" },
  { import = "astrocommunity.programming-language-support.csv-vim" },

  -- { import = "astrocommunity.game.leetcode-nvim" },
  --
  { import = "astrocommunity.git.gitgraph-nvim" },

  { import = "astrocommunity.docker.lazydocker" },

  -- { import = "astrocommunity.note-taking.obsidian-nvim" },
}
