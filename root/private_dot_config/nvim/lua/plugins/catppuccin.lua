return {
	"catppuccin/nvim",
	name = "catppuccin",
	main = "catppuccin",
	lazy = true,
	opts = {
		integrations = {
			notify = true,
			noice = true,
			mason = true,
			which_key = true,
		},
	},
	priority = 1000,
}
