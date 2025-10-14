local vue_ls = "$MASON/packages/vue-language-server/node_modules/@vue/language-server"

return {
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vim.fn.expand(vue_ls),
				languages = { "vue" },
				configNamespace = "typescript",
			},
		},
	},
	workspace_required = true,
	root_markers = {
		"package-lock.json",
		"yarn.lock",
		"pnpm-lock.yaml",
		"bun.lockb",
		"bun.lock",
	},
}
