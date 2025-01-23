local binds = require("binds.whichkey")

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		win = {
			border = "rounded",
		},
	},
	keys = binds.list,
}
