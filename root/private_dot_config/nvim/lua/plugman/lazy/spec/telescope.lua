local enabled = true

local sorter = {
	"nvim-telescope/telescope-fzf-native.nvim",
	name = "telescope-fzf-native",
	build = "make",
}

local selecter = {
	"nvim-telescope/telescope-ui-select.nvim",
	name = "telescope-ui-select",
}

local telescope = require("config.plugins.telescope")

return {
	"nvim-telescope/telescope.nvim",
	cond = enabled,
	name = "telescope",
	branch = "0.1.x",
	keys = telescope.keys,
	config = telescope.config,
	dependencies = {
		"nvim-lua/plenary.nvim",
		sorter,
		selecter,
	},
}
