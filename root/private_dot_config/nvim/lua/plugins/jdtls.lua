-- fix: use mason-registry.get_package
local exec = vim.env.HOME .. "/.local/share/nvim/mason/bin/jdtls"

local function config()
	local jdtls = require("jdtls")
	jdtls.start_or_attach(require("langservers.jdtls")(exec))
end

return {
	setup = config,
}
