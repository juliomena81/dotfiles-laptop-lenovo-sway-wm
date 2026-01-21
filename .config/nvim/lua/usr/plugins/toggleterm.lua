return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-t>]], -- Se abre con Ctrl + t
      hide_numbers = true,
      shade_terminals = true,
      direction = "float", -- Terminal flotante para seguir
      float_opts = {
        border = "rounded", -- Bordes redondeados como FZF
        winblend = 3,
      },
    })

    -- Mapeo extra para cerrarla fácil desde dentro
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      -- Escapar del modo terminal fácil
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      -- Moverse entre ventanas desde la terminal
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end,
}
