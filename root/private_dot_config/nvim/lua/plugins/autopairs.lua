local enabled = true

return {
	"windwp/nvim-autopairs",
	cond = enabled,
	main = "nvim-autopairs",
	lazy = true,
	event = "InsertEnter",
	opts = {},
}
