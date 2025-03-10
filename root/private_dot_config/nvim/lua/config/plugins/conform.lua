local M = {}

local api = vim.api

local formatters = require("config.formatters")

M.opts = {
	formatters_by_ft = formatters.by_filetype,
}

if formatters.opts.on_save then
	M.opts.format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	}
end

local function get_end(line2)
	return api.nvim_buf_get_lines(0, line2 - 1, line2, true)[1]
end

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		range = {
			["start"] = { args.line1, 0 },
			["end"] = { args.line2, get_end(args.line2):len() },
		}
	end

	require("conform").format({
		async = true,
		lsp_format = "fallback",
		range = range,
	})
end, { range = true })

function M.init()
	vim.o.formatexpr = 'v:lua.require("conform").formatexpr()'
end

return M
