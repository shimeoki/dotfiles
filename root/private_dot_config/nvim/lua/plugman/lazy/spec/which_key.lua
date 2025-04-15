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
	name = "which-key",
	main = "which-key",
	event = "VeryLazy",
	opts = opts,
}
