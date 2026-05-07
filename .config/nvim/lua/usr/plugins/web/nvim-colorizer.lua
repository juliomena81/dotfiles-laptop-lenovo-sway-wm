return {
  -- Colores hex y rgb
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*", -- todos los archivos
        css = { rgb_fn = true },
        html = { names = true },
      })
    end,
  },
}
