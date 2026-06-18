#!/bin/bash

set -e

# Detect OS
if [[ -f /etc/os-release ]]; then
  . /etc/os-release
  OS=$ID
else
  echo "Unsupported OS"
  exit 1
fi

# Install dependencies
install_deps() {
  case "$OS" in
  ubuntu | debian)
    sudo apt update && sudo apt install -y neovim git ripgrep fd-find gcc make nodejs npm python3-pip
    ;;
  arch | manjaro)
    sudo pacman -Syu --needed --noconfirm neovim git ripgrep fd base-devel nodejs npm python-pip
    ;;
  *)
    echo "Unsupported OS: $OS"
    exit 1
    ;;
  esac
}

# Install lazy.nvim
install_lazy() {
  LAZY_PATH="$HOME/.local/share/nvim/lazy/lazy.nvim"
  if [[ ! -d "$LAZY_PATH" ]]; then
    git clone --filter=blob:none https://github.com/folke/lazy.nvim.git "$LAZY_PATH"
  fi
}

# Set up Neovim config
deploy_config() {
  CONFIG_DIR="$HOME/.config/nvim"
  INIT_FILE="$CONFIG_DIR/init.lua"
  mkdir -p "$CONFIG_DIR"
  if [[ ! -f "$INIT_FILE" ]]; then
    cat >"$INIT_FILE" <<'EOF'
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true

-- Keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit Neovim" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save File" })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim", config = function()
      require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "tsserver" } })
    end },
  { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" } },
  { "nvim-tree/nvim-tree.lua", config = function() require("nvim-tree").setup() end },
  { "nvim-lualine/lualine.nvim", config = function() require("lualine").setup() end },
  { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end },
  { "numToStr/Comment.nvim", config = function() require("Comment").setup() end },
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup() end },
  -- { "folke/tokyonight.nvim", config = function() vim.cmd("colorscheme tokyonight") end },
  -- { "catppuccin/nvim", name = "catppuccin", config = function()
  --  require("catppuccin").setup({ flavour = "latte", -- Options: latte, frappe, macchiato, mocha })
  -- vim.cmd("colorscheme catppuccin")
  -- end },
  -- { "navarasu/onedark.nvim", name = "onedark", config = function() require("onedark").setup() vim.cmd("colorscheme onedark") end },
  { "Mofiqul/vscode.nvim", name = "vscode", config = function() vim.cmd("colorscheme vscode") end },
})
EOF
  fi
}

# Run installation steps
install_deps
install_lazy
deploy_config

echo "Neovim setup complete! Run 'nvim' to start."
