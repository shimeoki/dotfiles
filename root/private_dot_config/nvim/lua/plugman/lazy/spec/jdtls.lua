local enabled = true

local langservers = require("config.langservers")
local server = langservers.map.jdtls
local exec = vim.env.HOME .. "/.local/share/nvim/mason/bin/jdtls"

local function config()
	local jdtls = require("jdtls")
	jdtls.start_or_attach(server.config(exec))
end

local ft = server.filetypes

return {
	"mfussenegger/nvim-jdtls",
	cond = enabled,
	name = "jdtls",
	lazy = true,
	ft = ft,
	config = config,
}
