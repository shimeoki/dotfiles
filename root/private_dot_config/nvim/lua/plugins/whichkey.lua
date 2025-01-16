local binds = require("binds.whichkey")

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	keys = binds.list,
}
