return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- Actualiza automáticamente los registros
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "pyright", "bashls", "dockerls",
          "html", "cssls", "tailwindcss", "astro",
          "svelte"
        },
        automatic_installation = true,
      })
    end,
  },
}
