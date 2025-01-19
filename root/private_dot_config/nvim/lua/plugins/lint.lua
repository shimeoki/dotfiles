local import = require("import")

local cfg_path = "config.lint"
local cfg = require(cfg_path)
local enabled = cfg.lint_enabled

local function config()
	if not enabled then
		return false
	end

	local plug = require("lint")

	plug.linters_by_ft = cfg.filetype_linters

	vim.api.nvim_create_autocmd(cfg.lint_events, {
		callback = function()
			plug.try_lint()
		end,
	})

	local prefix = cfg_path .. "."
	local linter_cfg

	for _, linter in ipairs(cfg.enabled_linters) do
		linter_cfg = import.safe(prefix .. linter)
		if linter_cfg then
			plug.linters[linter].args = linter_cfg.args
		end
	end
end

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	cond = enabled,
	config = config,
}
