return {
  {
    "L3MON4D3/LuaSnip",
    -- Librería de snippets como dependencia directa
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      -- Cargar los miles de snippets de la librería
      require("luasnip.loaders.from_vscode").lazy_load()
      
      local ls = require("luasnip")

      -- Atajo para saltar entre campos del snippet con Tab
      vim.keymap.set({"i", "s"}, "<Tab>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
        end
      end, {silent = true})
    end,
  },
}
