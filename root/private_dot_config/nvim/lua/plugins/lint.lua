local enabled = true

local linters = require("config.linters")

local function config()
	if not linters.opts.enabled then
		return false
	end

	local lint = require("lint")

	lint.linters_by_ft = linters.by_filetype

	for _, linter in ipairs(linters.list) do
		if linter.config then
			lint.linters[linter.name].args = linter.config.args
		end
	end

	vim.api.nvim_create_autocmd(linters.opts.events, {
		group = vim.api.nvim_create_augroup("lint", { clear = true }),
		callback = function()
			lint.try_lint()
		end,
	})
end

return {
	"mfussenegger/nvim-lint",
	name = "lint",
	cond = enabled,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	config = config,
}
