local function jdtls_path()
	return vim.fn.exepath("jdtls")
end

local function config()
	local jdtls = require("jdtls")
	jdtls.start_or_attach(require("langservers.jdtls")(jdtls_path()))
end

return {
	setup = config,
}
