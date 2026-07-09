if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "milanglacier/minuet-ai.nvim",
  enabled = false,
  opts = {
    provider = "openai_fim_compatible",
    n_completions = 1, -- Save resources, use 1 completion
    context_window = 4096, -- Good for 4GB GPU
    throttle = 500, -- Min time between requests
    debounce = 300, -- Wait after typing stops
    provider_options = {
      openai_fim_compatible = {
        api_key = "TERM", -- Placeholder, Ollama ignores this
        name = "Ollama",
        end_point = "http://localhost:11434/v1/completions",
        model = "qwen2.5-coder:1.5b",
        optional = {
          max_tokens = 256,
          stop = { "\n\n" },
          top_p = 0.9,
        },
      },
    },
    virtualtext = {
      auto_trigger_ft = { "*" },
      keymap = {
        accept = "<Tab>", -- Tab to accept suggestion
        accept_line = "<C-y>", -- Ctrl+y to accept first line
        next = "<C-n>", -- Next suggestion
        prev = "<C-p>", -- Previous suggestion
        dismiss = "<C-e>", -- Dismiss suggestion
      },
    },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  specs = {
    { "hrsh7th/nvim-cmp", optional = true },
    { "saghen/blink.cmp", optional = true },
  },
}
