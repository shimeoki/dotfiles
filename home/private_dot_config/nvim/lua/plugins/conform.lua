local M = {}

local api = vim.api
local buf = vim.b
local global = vim.g

local formatters_by_ft = {
	lua = { "stylua" },
	go = { "golines" },
	python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
	sh = { "shfmt" },
	bash = { "shfmt" },
	zsh = { "shfmt" },
	c = { "clang-format" },
	cpp = { "clang-format" },
	javascript = { "deno_fmt" },
	javascriptreact = { "deno_fmt" },
	typescript = { "deno_fmt" },
	typescriptreact = { "deno_fmt" },
	json = { "deno_fmt" },
	jsonc = { "deno_fmt" },
	css = { "deno_fmt" },
	html = { "deno_fmt" },
	yaml = { "deno_fmt" },
	vue = { "deno_fmt" },
	markdown = { "deno_fmt" },
	nix = { "nixfmt" },
	-- toml = { "pyproject-fmt" }, -- fix: don't enable on all toml files
}

local deno = {
	append_args = {
		"--use-tabs=true",
		"--indent-width=4",
		"--line-width=80",
		"--no-semicolons=false",
		"--prose-wrap=always",
		"--single-quote=false",
	},
}

local clang = {
	append_args = {
		"--style",
		"{ BasedOnStyle: Chromium, IndentWidth: 4, LineEnding: LF }",
	},
}

local golines = {
	append_args = {
		"--max-len=80",
		"--tab-len=4",
	},
}

local nixfmt = {
	append_args = {
		"--width=80",
	},
}

-- source: https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save

local function get_end(line2)
	return api.nvim_buf_get_lines(0, line2 - 1, line2, true)[1]
end

local function format(args)
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
end

local function format_on_save(bufnr)
	if global.disable_format or buf[bufnr].disable_format then
		return
	end

	return { timeout_ms = 500, lsp_format = "fallback" }
end

local function disable_format(args)
	if args.bang then
		buf.disable_format = true
	else
		global.disable_format = true
	end
end

local function enable_format()
	buf.disable_format = false
	global.disable_format = false
end

local function create_commands()
	api.nvim_create_user_command("Format", format, { range = true })

	api.nvim_create_user_command("FormatDisable", disable_format, {
		desc = "disable format on save",
		bang = true,
	})

	api.nvim_create_user_command("FormatEnable", enable_format, {
		desc = "enable format on save",
	})
end

local function set_formatexpr()
	vim.opt.formatexpr = 'v:lua.require("conform").formatexpr()'
end

local opts = {
	formatters_by_ft = formatters_by_ft,
	format_on_save = format_on_save,
	formatters = {
		["deno_fmt"] = deno,
		["clang-format"] = clang,
		["golines"] = golines,
		["nixfmt"] = nixfmt,
	},
}

function M.setup()
	require("conform").setup(opts)
	create_commands()
	set_formatexpr()
end

return M
