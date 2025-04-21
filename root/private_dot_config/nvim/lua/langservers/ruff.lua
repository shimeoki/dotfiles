local line_length = 80
local rules = { "E4", "E7", "E9", "F" }

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client == nil then
			return
		end

		if client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end
	end,
	desc = "disable hover for ruff",
})

-- fix: why lint settings are here?

return {
	opts = {
		init_options = {
			settings = {
				lineLength = line_length,
				lint = { select = rules },
			},
		},
	},
}
