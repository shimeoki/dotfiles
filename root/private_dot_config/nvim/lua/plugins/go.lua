local enabled = true

return {
	"ray-x/go.nvim",
	cond = enabled,
	opts = {
		comment_placeholder = "",
		diagnostic = false, -- don't override user defaults
		luasnip = false, -- great snippets, but very unstable
	},
	main = "go",
	lazy = true,
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
}
