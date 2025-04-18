local M = {}

local langservers = require("config.langservers")

-- servers not managed by lspconfig
local external = {
	jdtls = true,
}

M.opts = {
	inlay_hints = { enabled = langservers.opts.hints },
	codelens = { enabled = langservers.opts.lens },
}

function M.setup()
	if not langservers.opts.enabled then
		return false
	end

	local lspconfig = require("lspconfig")

	local capabilities
	if langservers.opts.completions then
		local cmp = require("cmp_nvim_lsp")
		capabilities = cmp.default_capabilities()
	end

	local server_name, server_opts
	for _, server in ipairs(langservers.list) do
		if not external[server.name] then
			server_name = server.aliases.lspconfig or server.name

			local opts = {}

			if server.config then
				server_opts = server.config.opts
				if type(server_opts) == "function" then
					opts = server_opts()
				else
					opts = server_opts
				end

				opts.capabilities = capabilities
			end

			if server.filetypes then
				opts.filetypes = server.filetypes
			end

			lspconfig[server_name].setup(opts)
		end
	end

	if langservers.opts.hints then
		vim.lsp.inlay_hint.enable(true, { 0 })
	end
end

return M
