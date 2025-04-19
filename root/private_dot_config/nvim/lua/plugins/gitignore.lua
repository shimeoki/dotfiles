return {
	"wintermute-cell/gitignore.nvim",
	name = "gitignore",
	cond = true,
	config = function()
		require("gitignore")
	end,
	cmd = { "Gitignore" },
}
