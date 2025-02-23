local opts = {
	lspFeatures = {
		languages = { "python" },
		chunks = "all",
		diagnostics = {
			enabled = true,
			triggers = { "BufEnter", "BufWritePost", "InsertLeave" },
		},
		completion = { enabled = true },
	},
	codeRunner = {
		enabled = true,
		default_method = "molten",
	},
}

return {
	opts = opts,
}
