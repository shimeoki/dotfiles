local enabled = true

local binds = require("binds")
local keys = binds.convert(binds.map.quarto, "lazy")

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
	"quarto-dev/quarto-nvim",
	cond = enabled,
	main = "quarto",
	lazy = true,
	ft = { "quarto", "markdown", "json", "python" },
	keys = keys,
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = opts,
}
