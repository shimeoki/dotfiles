local M = {}

local lsp_cfg = require("config.lsp")
local fmt_cfg = require("config.fmt")

local runtime = "LuaJIT"

local globals = {
	"vim",
	"require",
}

local function on_init(client)
	if not client.workspace_folders then
		return
	end

	local path = client.workspace_folders[1].name
	local rc1 = vim.loop.fs_stat(path .. "/.luarc.json")
	local rc2 = vim.loop.fs_stat(path .. "/.luarc.jsonc")

	if rc1 or rc2 then
		return
	end

	local cfg = client.config.settings.Lua

	cfg = vim.tbl_deep_extend("force", cfg, {
		runtime = { version = runtime },
		workspace = {
			checkThirdParty = false,
			library = { vim.env.VIMRUNTIME },
		},
	})
end

-- source: https://github.com/neovim/neovim/issues/21686#issuecomment-1522446128
local settings = {
	runtime = { version = runtime },
	diagnostics = { globals = globals },
	telemetry = { enable = false },
	format = { enable = fmt_cfg.formatting_enabled },
	hint = { enable = lsp_cfg.hints },
}

M.opts = {
	on_init = on_init,
	settings = { Lua = settings },
}

return M
