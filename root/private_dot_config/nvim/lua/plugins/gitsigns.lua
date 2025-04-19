local enabled = true

return {
	"lewis6991/gitsigns.nvim",
	cond = enabled,
	main = "gitsigns",
	lazy = true,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {},
}
