local enabled = true

local sorter = {
	"nvim-telescope/telescope-fzf-native.nvim",
	name = "telescope-fzf-native",
	build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
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
	},
}
