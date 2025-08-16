local features = {
	languages = { "python" },
	chunks = "all",
	diagnostics = {
		enabled = true,
		triggers = { "BufEnter", "BufWritePost", "InsertLeave" },
	},
	completion = { enabled = true },
}

local runner = {
	enabled = true,
	default_method = "molten",
}

local opts = {
	lspFeatures = features,
	codeRunner = runner,
}

return {
	opts = opts,
}
