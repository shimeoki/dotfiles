local filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"vue",
}

local function vue_path()
	local vue_pkg = "$MASON/packages/vue-language-server"
	local ls_path = "/node_modules/@vue/language-server"
	return vim.fn.expand(vue_pkg .. ls_path)
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
