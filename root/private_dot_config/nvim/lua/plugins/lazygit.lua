local enabled = false

return {
	"kdheepak/lazygit.nvim",
	cond = enabled,
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
}
