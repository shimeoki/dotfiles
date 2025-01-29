local enabled = true
local name = "todo-comments"

local todo_comments = require("config.plugins.todo_comments")

return {
	"folke/todo-comments.nvim",
	cond = enabled,
	name = name,
	main = name,
	cmd = { "TodoTelescope" },
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = todo_comments.opts,
	dependencies = { "nvim-lua/plenary.nvim" },
}
