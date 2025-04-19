local enabled = true

return {
	"wintermute-cell/gitignore.nvim",
	cond = enabled,
	lazy = true,
	config = function()
		require("gitignore")
	end,
	cmd = { "Gitignore" },
}
