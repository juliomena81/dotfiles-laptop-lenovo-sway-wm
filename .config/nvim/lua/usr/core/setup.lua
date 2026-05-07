-- Evitar que el checkhealth bloquee el inicio con avisos de deprecación
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("silent! bwipeout! health://")
	end,
})

-- Forzar reconocimiento de archivos Zsh para compatibilidad con LSP/Linters
vim.filetype.add({
	extension = {
		zsh = "sh",
		zshrc = "sh",
		zprofile = "sh",
	},
})

-- Detectar archivos de Jekyll/ERB como Ruby/HTML
vim.filetype.add({
	extension = {
		erb = "eruby",
	},
})

loaded_perl_provider = 0

vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
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
vim.opt.wildoptions = "pum"

