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

M:parse_groups({ "mason" })

return M
