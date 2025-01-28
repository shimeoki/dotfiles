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

M:parse_groups({ "mason" })

return M
