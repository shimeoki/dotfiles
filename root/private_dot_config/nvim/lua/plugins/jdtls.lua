local import = require("import")

local mason_cfg = require("config.mason")
local exec = mason_cfg.home .. "/bin/jdtls"

local lsp_cfg = require("config.lsp")
local jdtls_cfg = import.safe("config.lsp.jdtls")
local enabled = lsp_cfg.enabled and lsp_cfg.servers["jdtls"]

local function config()
	if not enabled then
		return false
	end

	if not jdtls_cfg then
		return false
	end

	local plug = require("jdtls")
	plug.start_or_attach(jdtls_cfg.config(exec))
end

return {
	"mfussenegger/nvim-jdtls",
	cond = enabled,
	ft = "java",
	config = config,
}
