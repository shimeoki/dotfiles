local quarto = require("config.plugins").quarto

local binds = require("binds")
local keys = binds.convert(binds.map.quarto, "lazy")

return {
	"quarto-dev/quarto-nvim",
	cond = true,
	name = "quarto",
	ft = { "markdown" },
	keys = keys,
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = quarto.config.opts,
}
