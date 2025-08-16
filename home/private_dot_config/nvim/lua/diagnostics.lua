local icons = {
	Error = "󰅚 ",
	Warn = "󰀪 ",
	Hint = "󰌶 ",
	Info = " ",
}

local signs = {
	text = {},
	numhl = {},
	texthl = {},
}

for type, icon in pairs(icons) do
	local hl = "DiagnosticSign" .. type
	local severity = vim.diagnostic.severity[string.upper(type)]

	signs.text[severity] = icon
	signs.numhl[severity] = hl
	signs.texthl[severity] = hl
end

vim.diagnostic.config({
	underline = true,
	virtual_text = {
		source = true,
		spacing = 0,
		prefix = "",
		hl_mode = "replace",
		virt_text_pos = "eol",
	},
	float = {
		source = true,
	},
	update_in_insert = false,
	severity_sort = true,
	signs = signs,
})
