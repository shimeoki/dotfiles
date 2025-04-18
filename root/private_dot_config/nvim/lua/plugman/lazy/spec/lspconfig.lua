local enabled = true

local langservers = require("config.langservers")

-- servers not managed by lspconfig
local external = {
	jdtls = true,
}

local opts = {
	inlay_hints = { enabled = langservers.opts.hints },
	codelens = { enabled = langservers.opts.lens },
}

local function config()
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

			local lsopts = {}

			if server.config then
				server_opts = server.config.opts
				if type(server_opts) == "function" then
					lsopts = server_opts()
				else
					lsopts = server_opts
				end

				lsopts.capabilities = capabilities
			end

			if server.filetypes then
				lsopts.filetypes = server.filetypes
			end

			lspconfig[server_name].setup(lsopts)
		end
	end

	if langservers.opts.hints then
		vim.lsp.inlay_hint.enable(true, { 0 })
	end
end

return {
	"neovim/nvim-lspconfig",
	cond = enabled,
	name = "lspconfig",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	config = config,
	opts = opts,
}
