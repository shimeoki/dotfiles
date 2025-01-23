return {
	"folke/todo-comments.nvim",
	name = "todo-comments",
	main = "todo-comments",
	cmd = { "TodoTelescope" },
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {
		signs = false,
	},
	dependencies = { "nvim-lua/plenary.nvim" },
}
