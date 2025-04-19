local enabled = true

local function init()
	vim.g.molten_auto_open_output = false
	vim.g.molten_image_provider = "image.nvim"
	vim.g.molten_virt_text_output = true
	vim.g.molten_wrap_output = true
	vim.g.molten_virt_lines_off_by_1 = true
	vim.g.molten_virt_text_max_lines = 999
end

return {
	"benlubas/molten-nvim",
	cond = enabled,
	lazy = true,
	ft = { "python", "markdown", "json" },
	version = "^1.0.0",
	build = ":UpdateRemotePlugins",
	init = init,
}
