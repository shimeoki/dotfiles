local quarto = require("config.plugins").quarto

return {
	"quarto-dev/quarto-nvim",
	name = "quarto",
	ft = { "markdown" },
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = quarto.config.opts,
}
