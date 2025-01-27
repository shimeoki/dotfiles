local langservers = require("config.langservers")

local enabled = true

local opts = {
	inlay_hints = { enabled = langservers.opts.hints },
	codelens = { enabled = langservers.opts.lens },
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
	if langservers.opts.completions then
		local cmp = require("cmp_nvim_lsp")
		capabilities = cmp.default_capabilities()
	end

	local server_name, server_opts
	for _, server in ipairs(langservers.enabled) do
		if not external[server.name] then
			server_name = server.aliases.lspconfig or server.name

			if server.config then
				server_opts = server.config.opts
				server_opts.capabilities = capabilities
				plug[server_name].setup(server_opts)
			end
		end
	end

	if langservers.opts.hints then
		vim.lsp.inlay_hint.enable(true, { 0 })
	end
end

return {
	"neovim/nvim-lspconfig",
	cond = enabled,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = opts,
	config = config,
}
