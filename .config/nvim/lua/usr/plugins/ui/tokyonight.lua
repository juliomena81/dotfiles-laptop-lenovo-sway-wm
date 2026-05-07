return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "night", -- opciones: "storm", "night", "day"
		transparent = false,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = { bold = true },
			variables = {},
		},
	},
	-- config = function(_, opts)
	--	require("tokyonight").setup(opts)
	--	vim.cmd("colorscheme tokyonight")

	-- Lualine integración
	--	require("lualine").setup({
	--	options = { theme = "tokyonight" },
	--	})

	-- Ejemplo de integración manual para Neo-tree
	--	vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#1a1b26", fg = "#c0caf5" })
	--	vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { bg = "#414868", fg = "#c0caf5" })

	-- FZF-Lua
	--	vim.api.nvim_set_hl(0, "FzfLuaNormal", { bg = "#1a1b26", fg = "#c0caf5" })
	--	vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = "#414868" })

	-- Alpha (dashboard)
	--	vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#7aa2f7" })
	--	vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#9ece6a" })

	-- Mason
	--	vim.api.nvim_set_hl(0, "MasonNormal", { bg = "#1a1b26", fg = "#c0caf5" })
	--	vim.api.nvim_set_hl(0, "MasonHeader", { fg = "#f7768e" })
	--	end,
}
