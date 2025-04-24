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
})

M:add({
	name = "ruff_format",
	enabled = true,
	filetypes = { "python" },
})

M:add({
	name = "ruff_organize_imports",
	enabled = true,
	filetypes = { "python" },
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
	config = require("formatters.clang"),
})

-- warn: doesn't work, don't turn this on
M:add({
	name = "nufmt",
	enabled = false,
	filetypes = { "nu" },
})

M:add({
	name = "deno_fmt",
	enabled = true,
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"jsonc",
		"css",
		"html",
		"yaml",
		"vue",
	},
	config = require("formatters.deno"),
})

-- fix: don't enable on all toml files
M:add({
	name = "pyproject-fmt",
	enabled = false,
	filetypes = { "toml" },
})

M:parse_groups()

return M
