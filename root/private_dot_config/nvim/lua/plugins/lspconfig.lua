local import = require("import")

local cfg_path = "config.lsp"
local cfg = require(cfg_path)
local enabled = cfg.enabled

local opts = {
	inlay_hints = { enabled = cfg.hints },
	codelens = { enabled = cfg.lens },
}

-- servers that are not managed by lspconfig
local external = {
	jdtls = true,
}

local function config()
	if not enabled then
		return false
	end

	local plug = require("lspconfig")

	local capabilities
	if cfg.completions then
		local cmp = require("cmp_nvim_lsp")
		capabilities = cmp.default_capabilities()
	end

	local prefix = cfg_path .. "."
	local server_cfg
	local server_name
	local server_opts

	for _, server in ipairs(cfg.enabled_servers) do
		server_cfg = import.safe(prefix .. server)
		if not external[server] and server_cfg then
			server_name = cfg.server_lspconfig_name[server]
			if not server_name then
				server_name = server
			end

			server_opts = server_cfg.opts
			server_opts.capabilities = capabilities
			plug[server_name].setup(server_opts)
		end
	end
end

return {
	"neovim/nvim-lspconfig",
	cond = enabled,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = opts,
	config = config,
}
