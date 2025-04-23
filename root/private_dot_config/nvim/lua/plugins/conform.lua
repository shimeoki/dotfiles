local api = vim.api

local formatters = require("formatters")

local opts = {
	formatters_by_ft = formatters.by_filetype,
}

if formatters.opts.on_save then
	opts.format_on_save = {
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

local function config()
	local conform = require("conform")
	conform.setup(opts)

	vim.o.formatexpr = 'v:lua.require("conform").formatexpr()'

	local formatter_name
	for _, formatter in ipairs(formatters.list) do
		formatter_name = formatter.aliases.conform or formatter.name

		if formatter.config then
			conform.formatters[formatter_name] = formatter.config
		end
	end
end

return {
	setup = config,
}
