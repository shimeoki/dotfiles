return {
	-- disable hover
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
	init_options = {
		settings = {
			lineLength = 80,
			lint = { select = { "E4", "E7", "E9", "F" } },
		},
	},
}
