return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "williamboman/mason.nvim",          build = ":MasonUpdate" },
    { "williamboman/mason-lspconfig.nvim" },
  },
  config = function()
    -- 1. Inicializar Mason
    require("mason").setup()

    local mason_lspconfig = require("mason-lspconfig")
    local servers = {
      "lua_ls", "pyright", "bashls", "dockerls", "html",
      "cssls", "tailwindcss", "astro", "svelte",
    }

    mason_lspconfig.setup({
      ensure_installed = servers,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    for _, server_name in ipairs(servers) do
      local opts = {
        capabilities = capabilities,
      }


      if server_name == "lua_ls" then
        opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
      end


      vim.lsp.config(server_name, opts)
    end


    for _, server_name in ipairs(servers) do
      vim.lsp.enable(server_name)
    end


    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
    })
  end,
}

