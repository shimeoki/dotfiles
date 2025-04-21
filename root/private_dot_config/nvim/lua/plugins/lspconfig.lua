local enabled = true

local langservers = require("langservers")

-- servers that are not managed by lspconfig
local external = {
	jdtls = true,
}

local function config()
	if not langservers.opts.enabled then
		return
	end

	if langservers.opts.hints then
		vim.lsp.inlay_hint.enable()
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
			end

			if server.filetypes then
				lsopts.filetypes = server.filetypes
			end

			vim.lsp.config(server_name, lsopts)
			vim.lsp.enable(server_name)
		end
	end
end

return {
	"neovim/nvim-lspconfig",
	cond = enabled,
	lazy = true,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	config = config,
}
