local enabled = true
local name = "jdtls"

local jdtls = require("config.plugins.jdtls")

return {
	"mfussenegger/nvim-jdtls",
	cond = enabled,
	name = name,
	ft = jdtls.ft,
	config = jdtls.config,
}
