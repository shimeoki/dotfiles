local enabled = true

local preset = "modern"
local border = "rounded"

local opts = {
	preset = preset,
	win = {
		border = border,
	},
}

return {
	"folke/which-key.nvim",
	cond = enabled,
	main = "which-key",
	lazy = true,
	event = "VeryLazy",
	opts = opts,
}
