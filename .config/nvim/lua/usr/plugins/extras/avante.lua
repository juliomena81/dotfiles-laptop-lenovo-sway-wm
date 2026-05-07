return {
  "yetone/avante.nvim",
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-neo-tree/neo-tree.nvim",
    "folke/snacks.nvim"
  },
  opts = {
    ui = {
      input_provider = "snacks",
      input = { conceal = false }, -- evita el choque con native
    },
    provider = "openrouter",
    providers = {
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        model = "deepseek/deepseek-chat",
        api_key = (function()
          -- Alternativa para Linux (usando secret-tool)
          local handle = io.popen('secret-tool lookup service openrouter_api_key 2>/dev/null')
          if handle then
            local result = handle:read("*a")
            handle:close()
            return result:gsub("%s+$", "") -- Eliminar espacios/tabs/newlines al final
          end
          return nil                       -- Fallback si no se encuentra la clave
        end)(),
        headers = {
          ["HTTP-Referer"] = "http://localhost",
          ["X-Title"] = "Avante.nvim"
        },
        extra_request_body = {
          temperature = 0.3,
          max_tokens = 4096,
          top_p = 0.9
        }
      }
    },
    behaviour = {
      auto_suggestions = false,
      auto_apply_diff_after_generation = false,
      auto_set_keymaps = false
    },
    prompts = require("usr.prompts.avante_prompts")
  },
  init = function()
    -- Keymaps corregidos (usando sintaxis correcta)
    vim.keymap.set("n", "<leader>aq", ":AvanteAsk<CR>", { desc = "Avante: Preguntar" })
    vim.keymap.set("v", "<leader>ae", ":AvanteEdit<CR>", { desc = "Avante: Editar selección" })

    -- Integración con NeoTree
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "neo-tree",
      callback = function()
        vim.keymap.set("n", "<leader>af", function()
          local node = require("neo-tree.sources.manager").get_state().current_node
          if node then
            require("avante.api").add_file(node:get_id())
          end
        end, { buffer = true, desc = "Avante: Añadir archivo" })
      end
    })
  end
}
