local M = {}

-- enable or disable lsp's here
local enabled = {
	lua_ls = true,
}

local hints = true
local lens = true

-- make a list from enabled lsp's
M.list = {}
for k, v in pairs(enabled) do
	if v then
		table.insert(M.list, k)
	end
end

function M.init()
	local cfg = require("lspconfig")
	if not cfg then
		return
	end

	local cmp = require("cmp_nvim_lsp")
	if not cmp then
		return
	end

	local capabilities = cmp.default_capabilities()

	local prefix = "config.lsp."
	local lspcfg
	local opts

	for _, v in ipairs(M.list) do
		lspcfg = require(prefix .. v)
		if lspcfg then
			opts = lspcfg.opts
			opts.capabilities = capabilities
			cfg[v].setup(opts)
		end
	end
end

M.opts = {
	inlay_hints = { enabled = hints },
	codelens = { enabled = lens },
}

return M
