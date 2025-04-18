-- fix: duplicated
local filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"vue",
}

local function vue_path()
	local mason_registry = require("mason-registry")
	local mason_vue = mason_registry.get_package("vue-language-server")
	return mason_vue:get_install_path() .. "/node_modules/@vue/language-server"
end

local function vue_plugin()
	return {
		name = "@vue/typescript-plugin",
		location = vue_path(),
		languages = { "vue" },
	}
end

local function opts()
	return {
		init_options = {
			plugins = { vue_plugin() },
		},
		filetypes = filetypes,
	}
end

return {
	opts = opts,
}
