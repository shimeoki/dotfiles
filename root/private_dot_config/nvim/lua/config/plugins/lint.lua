local M = {}

local linters = require("config.linters")

function M.setup()
	if not linters.opts.enabled then
		return false
	end

	local lint = require("lint")

	vim.api.nvim_create_autocmd(linters.opts.events, {
		callback = function()
			lint.try_lint()
		end,
	})

	for _, linter in ipairs(linters.enabled) do
		if linter.config then
			lint.linters[linter.name].args = linter.config.args
		end
	end
end

return M
