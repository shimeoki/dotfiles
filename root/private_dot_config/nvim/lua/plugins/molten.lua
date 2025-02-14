return {
	"benlubas/molten-nvim",
	cond = true,
	name = "molten",
	version = "^1.0.0",
	build = ":UpdateRemotePlugins",
	init = function()
		vim.g.molten_image_provider = "image.nvim"
	end,
}
