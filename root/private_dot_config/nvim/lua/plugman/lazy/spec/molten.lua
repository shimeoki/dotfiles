local enabled = true

vim.g.molten_auto_open_output = false
vim.g.molten_image_provider = "image.nvim"
vim.g.molten_virt_text_output = true
vim.g.molten_wrap_output = true
vim.g.molten_virt_lines_off_by_1 = true
vim.g.molten_virt_text_max_lines = 999

return {
	"benlubas/molten-nvim",
	cond = enabled,
	name = "molten",
	lazy = true,
	ft = { "python", "markdown", "json" },
	version = "^1.0.0",
	build = ":UpdateRemotePlugins",
}
