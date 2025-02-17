local enabled = true
local name = "noice"

local noice = require("config.plugins.noice")

return {
	"folke/noice.nvim",
	cond = enabled,
	name = name,
	main = name,
	event = "VeryLazy",
	opts = noice.opts,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
