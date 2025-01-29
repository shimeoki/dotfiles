local enabled = true
local name = "which-key"

local which_key = require("config.plugins.which_key")

return {
	"folke/which-key.nvim",
	cond = enabled,
	name = name,
	main = name,
	event = "VeryLazy",
	opts = which_key.opts,
}
