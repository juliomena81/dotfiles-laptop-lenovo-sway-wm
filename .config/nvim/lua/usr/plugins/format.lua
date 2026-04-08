return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" }, -- Black
      sh = { "shfmt" },              -- Scripts de Zsh/Bash
    },
    format_on_save = {
      lsp_fallback = true,        
      timeout_ms = 500,
    },
  },
}
