local enabled = true

local presets = {
	command_palette = true,
	long_message_to_split = true,
	lsp_doc_border = true,
}

local lsp = {
	override = {
		["vim.lsp.util.convert_input_to_markdown_lines"] = true,
		["vim.lsp.util.stylize_markdown"] = true,
		-- only for nvim-cmp
		-- ["cmp.entry.get_documentation"] = true,
	},
}

local opts = {
	lsp = lsp,
	presets = presets,
}

return {
	"folke/noice.nvim",
	cond = enabled,
	main = "noice",
	event = "VeryLazy",
	opts = opts,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
