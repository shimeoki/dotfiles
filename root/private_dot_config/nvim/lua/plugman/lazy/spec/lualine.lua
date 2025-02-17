local enabled = true
local name = "lualine"

local lualine = require("config.plugins.lualine")

return {
	"nvim-lualine/lualine.nvim",
	cond = enabled,
	name = name,
	main = name,
	event = "VeryLazy",
	opts = lualine.opts,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
