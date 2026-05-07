return {
	"EdenEast/nightfox.nvim",

	config = function()
		require("nightfox").setup({
			options = {},
		})
		vim.cmd.colorscheme("terafox")
	end,
}
