local M = require("toolbox").new({
	enabled = true,
	on_save = true,
})

M:add({
	name = "stylua",
	enabled = true,
	filetypes = { "lua" },
})

M:add({
	name = "goimports",
	enabled = true,
	filetypes = { "go" },
})

-- fixme: multiple names support?

M:add({
	name = "ruff_fix",
	enabled = true,
	filetypes = { "python" },
	aliases = {
		mason = "ruff",
	},
})

M:add({
	name = "ruff_format",
	enabled = true,
	filetypes = { "python" },
	aliases = {
		mason = "ruff",
	},
})

M:add({
	name = "ruff_organize_imports",
	enabled = true,
	filetypes = { "python" },
	aliases = {
		mason = "ruff",
	},
})

M:add({
	name = "shfmt",
	enabled = true,
	filetypes = { "sh", "bash", "zsh" },
})

M:add({
	name = "clang-format",
	enabled = true,
	filetypes = { "c", "cpp" },
	config = require("config.formatters.clang"),
})

-- warn: doesn't work, don't turn this on
M:add({
	name = "nufmt",
	enabled = false,
	filetypes = { "nu" },
	aliases = {
		mason = "",
	},
})

M:add({
	name = "deno_fmt",
	enabled = true,
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	aliases = {
		mason = "deno",
	},
	config = require("config.formatters.deno"),
})

M:parse_groups({ "mason" })

return M
