local enabled = true

return {
	"mikesmithgh/kitty-scrollback.nvim",
	cond = enabled,
	lazy = true,
	main = "kitty-scrollback",
	name = "kitty-scrollback",
	cmd = {
		"KittyScrollbackGenerateKittens",
		"KittyScrollbackCheckHealth",
		"KittyScrollbackGenerateCommandLineEditing",
	},
	event = { "User KittyScrollbackLaunch" },
	version = "^6.0.0",
	opts = {},
}
