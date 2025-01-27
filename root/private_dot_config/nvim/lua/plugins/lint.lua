local enabled = true

local linters = require("config.linters")

local function config()
	if not enabled then
		return false
	end

	local plug = require("lint")

	plug.linters_by_ft = linters.by_filetype

	vim.api.nvim_create_autocmd(linters.opts.events, {
		callback = function()
			plug.try_lint()
		end,
	})

	for _, linter in ipairs(linters.enabled) do
		if linter.config then
			plug.linters[linter.name].args = linter.config.args
		end
	end
end

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	cond = enabled,
	config = config,
}
