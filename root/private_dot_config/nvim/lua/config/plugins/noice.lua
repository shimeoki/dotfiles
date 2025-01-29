local M = {}

local presets = {
	command_palette = true,
	long_message_to_split = true,
	lsp_doc_border = true,
}

local lsp = {
	override = {
		["vim.lsp.util.convert_input_to_markdown_lines"] = true,
		["vim.lsp.util.stylize_markdown"] = true,
		["cmp.entry.get_documentation"] = true,
	},
}

M.opts = {
	lsp = lsp,
	presets = presets,
}

return M
