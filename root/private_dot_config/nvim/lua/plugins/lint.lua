local M = {}

local linters_by_ft = {
	lua = { "luacheck" },
	go = { "golangcilint" },
	gomod = { "golangcilint" },
	python = { "dmypy" },
}

local luacheck = {
	args = {
		"--globals",
		"vim", -- ignore global vim variable
		"--",
	},
}

local function set_configs()
	local lint = require("lint")

	lint.linters["luacheck"].args = luacheck.args
end

vim.api.nvim_create_autocmd({
	"BufEnter",
	"BufWritePost",
	"InsertLeave",
}, {
	group = vim.api.nvim_create_augroup("Lint", { clear = true }),
	callback = function()
		require("lint").try_lint()
	end,
})

function M.setup()
	require("lint").linters_by_ft = linters_by_ft
	set_configs()
end

return M
