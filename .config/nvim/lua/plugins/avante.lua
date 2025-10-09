if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "yetone/avante.nvim",
  opts = {
    instructions_file = "avante.md",
    provider = "ollama",
    providers = {
      ollama = {
        endpoint = "http://localhost:11434",
        model = "qwen2.5-coder:1.5b",
      },
    },
  },
}
