local M = {}

local linters = {
	lua = { "luacheck" },
}

M.list = {}
for _, t in pairs(linters) do
	for _, v in ipairs(t) do
		table.insert(M.list, v)
	end
end

local events = {
	"BufEnter",
	"BufWritePost",
	"InsertLeave",
}

local function plug()
	return require("lint")
end

function M.init()
	local p = plug()

	p.linters_by_ft = linters

	vim.api.nvim_create_autocmd(events, {
		callback = function()
			p.try_lint()
		end,
	})

	local prefix = "config.lint."
	local cfg

	for _, v in ipairs(M.list) do
		-- todo check require
		cfg = require(prefix .. v)
		p.linters[v].args = cfg.args
	end
end

return M
