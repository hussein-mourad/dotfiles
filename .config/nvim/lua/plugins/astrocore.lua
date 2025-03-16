-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = true, -- sets vim.opt.wrap
        colorcolumn = "80",
        scrolloff = 2,
        linebreak = true,
        clipboard = "unnamedplus",
        -- columns = 80,
        -- undodir = os.getenv "HOME" .. "/.nvim/undodir",
        -- textwidth = 0,
        -- wrapmargin = 0,
        fillchars = {
          vert = "│",
          horiz = "─",
          horizup = "┴",
          horizdown = "┬",
          vertleft = "┤",
          vertright = "├",
          verthoriz = "┼",
        },
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        -- L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        -- H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

        ["<C-d>"] = { "<C-d>zz", desc = "Center the cursor after motion" },
        ["<C-u>"] = { "<C-u>zz", desc = "Center the cursor after motion" },
        ["n"] = { "nzzzv", desc = "Center the cursor after search" },
        ["N"] = { "Nzzzv", desc = "Center the cursor after search" },
        ["="] = { "<C-a>", desc = "Increment" },
        ["-"] = { "<C-x>", desc = "Decrement" },

        ["<leader>ga"] = { "<cmd>AerialToggle<cr>", desc = "Toggle code outline" },
        ["!"] = {
          function()
            -- Toggle boolean value
            local word = vim.fn.expand "<cword>"
            local toggle_map = {
              ["true"] = "false",
              ["false"] = "true",
              ["True"] = "False",
              ["False"] = "True",
              ["1"] = "0",
              ["0"] = "1",
            }
            if toggle_map[word] == nil then return end
            local new_word = toggle_map[word]
            vim.api.nvim_feedkeys("ciw" .. new_word, "n", true)
            local key = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
            vim.api.nvim_feedkeys(key, "n", true)
          end,
          desc = "invert current word",
        },
        ["<leader>k"] = { name = "Keymaps" },
        ["<leader>ka"] = { "<cmd>set keymap=arabic<cr>", desc = "Change keymap to arabic" },
        ["<leader>ke"] = { '<cmd>set keymap="<cr>', desc = "Change keymap to english" },
        ["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Find all todos" },
        -- ["<Leader>m"] = { desc = "Markdown" },
        -- ["<leader>mp"] = { "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview in Browser" },
        -- ["<leader>mg"] = { "<cmd>Glow<cr>", desc = "Glow Preview" },
        ["<leader>Mg"] = { "<cmd>Glow<cr>", desc = "Glow Preview" },
        ["<leader>Me"] = { "<cmd>PeekOpen<cr>", desc = "Peek Open Preview" },
        ["<leader>Mc"] = { "<cmd>PeekClose<cr>", desc = "Peek Close Preview" },
        ["<M-t>"] = { "<cmd>ToggleTerm size=12 direction=horizontal<cr>", desc = "Toggle horizontal terminal" },
        ["<C-b>"] = { "<cmd>OverseerRun<cr>", desc = "Run command" },
      },
      t = {
        ["<M-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle horizontal terminal" },
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
