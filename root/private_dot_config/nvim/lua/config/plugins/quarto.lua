local opts = {
	lspFeatures = {
		languages = { "python" },
		chunks = "all",
		diagnostics = {
			enabled = true,
			triggers = { "BufWritePost" },
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
