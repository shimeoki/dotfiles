local enabled = true

local langservers = require("config.langservers")
local exec = require("config.mason").home .. "/bin/jdtls"

local function config()
	if not enabled then
		return false
	end

	local plug = require("jdtls")
	plug.start_or_attach(langservers.map.jdtls.config(exec))
end

return {
	"mfussenegger/nvim-jdtls",
	cond = enabled,
	ft = "java",
	config = config,
}
