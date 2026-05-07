return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      sh = { "shfmt" },
      dockerfile = { "hadolint" },
      html = { "prettier" },
      css = { "prettier" },
      astro = { "prettier" },
      svelte = { "prettier" },
    },
    -- Configuración de formateo al guardar
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
    -- Integración para limpiar espacios finales automáticamente
    formatters = {
      trim_whitespace = {
        prepend_args = { "--trim-trailing-whitespace" },
      },
    },
  },
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)
    
    -- Opcional: si quieres asegurar el trim en todos los tipos de archivo
    -- conform.nvim lo hace de forma implícita si está configurado en los formatters
  end,
}