return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Carga esto lo antes posible pero sin bloquear
  opts = {
    -- Aquí configuramos los grupos para que aparezcan en el menú visual
    spec = {
      { "<leader>g", group = "Git" },
      { "<leader>t", group = "Testing" },
      { "<leader>d", group = "Debug (DAP)" },
      { "<leader>f", group = "Fzf-Lua (Buscar)" },
      { "<leader>a", group = "Harpoon" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
  end,
}