local enabled = false

return {
	"nvim-tree/nvim-tree.lua",
	cond = enabled,
	opts = {},
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
