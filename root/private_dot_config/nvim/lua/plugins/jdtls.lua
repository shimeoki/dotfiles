local langservers = require("langservers")
local server = langservers.map.jdtls
local exec = vim.env.HOME .. "/.local/share/nvim/mason/bin/jdtls"

local function config()
	local jdtls = require("jdtls")
	jdtls.start_or_attach(server.config(exec))
end

return {
	setup = config,
}
