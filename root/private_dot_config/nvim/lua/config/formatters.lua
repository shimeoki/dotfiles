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

M:parse_groups({ "mason" })

return M
