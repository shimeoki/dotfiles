local M = {}

local langservers = require("config.langservers")
local server = langservers.map.jdtls
local exec = require("config.plugins.mason").home .. "/bin/jdtls"

function M.config()
	local jdtls = require("jdtls")
	jdtls.start_or_attach(server.config(exec))
end

M.ft = server.filetypes

return M
