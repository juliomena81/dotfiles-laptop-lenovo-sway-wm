return {

  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,

  config = function()

    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
            light = "latte",
            dark = "mocha",
    },

        transparent_background = false, 
        show_end_of_buffer = false, 
        term_colors = false, 
        dim_inactive = {
            enabled = true, 
            shade = "dark",
            percentage = 0.17, 
    },

        no_italic = false, 
        no_bold = false, 
        no_underline = false, 
        styles = { 
            comments = { "italic" }, 
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
            -- miscs = {},  
    },

        default_integrations = false,
        integrations = {
            neotree = true,
            treesitter = true,
            fzf = true,
            neogit = true,
            cmp = true,
            which_key = true,
            diffview = true,
            fidget = true,
            mason = true,
            window_picker = true,
            alpha = true
        },

  })

  vim.cmd.colorscheme "catppuccin"

  end
}
