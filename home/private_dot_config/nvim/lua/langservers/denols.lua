local filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
}

return {
	opts = {
		filetypes = filetypes,
		workspace_required = true,
		root_markers = {
			"deno.json",
			"deno.jsonc",
			"deno.lock",
		},
	},
}
