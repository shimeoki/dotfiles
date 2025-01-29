local enabled = true
local name = "gitsigns"

return {
	"lewis6991/gitsigns.nvim",
	cond = enabled,
	name = name,
	main = name,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {},
}
