local langservers = require("config.langservers")

local name = "jdtls"
local server = langservers.map[name]
local enabled = langservers.opts.enabled and server.enabled
local exec = require("config.plugins.mason").home .. "/bin/jdtls"

local function config()
	local jdtls = require(name)
	jdtls.start_or_attach(server.config(exec))
end

return {
	"mfussenegger/nvim-jdtls",
	name = name,
	cond = enabled,
	ft = server.filetypes,
	config = config,
}
