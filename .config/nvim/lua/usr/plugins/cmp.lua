return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Motores de fuentes
    "hrsh7th/cmp-nvim-lsp",     -- Fuente para LSP (Python, Lua, Zsh)
    "hrsh7th/cmp-buffer",       -- Fuente para texto en el buffer actual
    "hrsh7th/cmp-path",         -- Fuente para rutas de archivos
    "hrsh7th/cmp-cmdline",      -- Autocompletado en la línea de comandos de nvim
    -- Snippets (Requerido por cmp)
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Navegación minimalista
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip",  priority = 750 },
        { name = "path",     priority = 500 },
        { name = "buffer",   priority = 250 },
      }),
    })

    -- Autocompletado para el modo comando (:)
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" }
      }, {
        { name = "cmdline" }
      })
    })
  end,
}
