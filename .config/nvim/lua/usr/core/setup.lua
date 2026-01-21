-- Forzar reconocimiento de archivos Zsh para compatibilidad con LSP/Linters
vim.filetype.add({
  extension = {
    zsh = "sh",
    zshrc = "sh",
    zprofile = "sh",
  },
})

-- Autocomando para limpiar espacios al final de la línea antes de guardar
local clean_group = vim.api.nvim_create_augroup("CleanWhitespace", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = clean_group,
  pattern = "*",
  callback = function()
    -- Guardar la posición actual del cursor para evitar saltos molestos
    local save_cursor = vim.fn.getpos(".")
    -- Ejecutar el comando de sustitución: %s/\s\+$//e
    -- \s\+$ busca uno o más espacios al final de línea
    -- /e evita que falle si no encuentra espacios
    vim.cmd([[%s/\s\+$//e]])
    -- Restaurar la posición del cursor
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Detectar archivos de Jekyll/ERB como Ruby/HTML
vim.filetype.add({
  extension = {
    erb = "eruby",
  },
})

vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.readonly = false
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.wildoptions = 'pum'
