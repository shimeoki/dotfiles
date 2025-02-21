-- fix: separate

return {
	"quarto-dev/quarto-nvim",
	name = "quarto",
	ft = { "markdown" },
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		lspFeatures = {
			languages = { "python" },
			chunks = "all",
			diagnostics = {
				enabled = true,
				triggers = { "BufWritePost" },
			},
			completion = { enabled = true },
		},
		codeRunner = {
			enabled = true,
			default_method = "molten",
		},
	},
}
