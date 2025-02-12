vim.diagnostic.config({
	underline = true,
	virtual_text = {
		source = true,
		spacing = 0,
		prefix = "",
		hl_mode = "replace",
		virt_text_pos = "eol",
	},
	signs = true,
	float = {
		source = true,
		border = "rounded",
	},
	update_in_insert = false,
	severity_sort = true,
})

local signs = {
	Error = "󰅚 ",
	Warn = "󰀪 ",
	Hint = "󰌶 ",
	Info = " ",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
