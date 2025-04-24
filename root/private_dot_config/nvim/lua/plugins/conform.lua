local M = {}

local api = vim.api

local formatters_by_ft = {
	lua = { "stylua" },
	go = { "goimports" },
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
	toml = { "pyproject-fmt" }, -- fix: don't enable on all toml files
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

local opts = {
	formatters_by_ft = formatters_by_ft,
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters = {
		["deno_fmt"] = deno,
		["clang-format"] = clang,
	},
}

local function set_formatexpr()
	vim.opt.formatexpr = 'v:lua.require("conform").formatexpr()'
end

local function get_end(line2)
	return api.nvim_buf_get_lines(0, line2 - 1, line2, true)[1]
end

api.nvim_create_user_command("Format", function(args)
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

function M.setup()
	require("conform").setup(opts)
	set_formatexpr()
end

return M
