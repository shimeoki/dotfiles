-- INFO: sources
-- https://github.com/neovim/nvim-lspconfig/blob/ac98db2f9f06a56498ec890a96928774eae412c3/lsp/ts_ls.lua
-- https://github.com/vuejs/language-tools/wiki/Neovim

local vue_ls = "$MASON/packages/vue-language-server/node_modules/@vue/language-server"

local root_markers = {
	"package-lock.json",
	"yarn.lock",
	"pnpm-lock.yaml",
	"bun.lockb",
	"bun.lock",
	{ ".git" },
}

return {
	cmd = { "typescript-language-server", "--stdio" },
	init_options = {
		hostInfo = "neovim",
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
	root_markers = root_markers,
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
	},
	root_dir = function(bufnr, on_dir)
		-- deno projects are managed by denols.
		-- use deno.lock as the marker, because deno.json can be used
		-- for formatting. deno.lock suggests "full deno project"
		local deno_markers = { "deno.lock" }
		if vim.fs.root(bufnr, deno_markers) then
			return
		end

		on_dir(vim.fs.root(bufnr, root_markers) or vim.fn.getcwd())
	end,
	handlers = {
		-- handle rename request for certain code actions like extracting functions / types
		["_typescript.rename"] = function(_, result, ctx)
			local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
			vim.lsp.util.show_document({
				uri = result.textDocument.uri,
				range = {
					start = result.position,
					["end"] = result.position,
				},
			}, client.offset_encoding)
			vim.lsp.buf.rename()
			return vim.NIL
		end,
	},
	commands = {
		["editor.action.showReferences"] = function(command, ctx)
			local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
			local file_uri, position, references = unpack(command.arguments)

			local quickfix_items = vim.lsp.util.locations_to_items(references, client.offset_encoding)
			vim.fn.setqflist({}, " ", {
				title = command.title,
				items = quickfix_items,
				context = {
					command = command,
					bufnr = ctx.bufnr,
				},
			})

			vim.lsp.util.show_document({
				uri = file_uri,
				range = {
					start = position,
					["end"] = position,
				},
			}, client.offset_encoding)

			vim.cmd("botright copen")
		end,
	},
	on_attach = function(client, bufnr)
		-- ts_ls provides `source.*` code actions that apply to the whole file. These only appear in
		-- `vim.lsp.buf.code_action()` if specified in `context.only`.
		vim.api.nvim_buf_create_user_command(bufnr, "LspTypescriptSourceAction", function()
			local source_actions = vim.tbl_filter(function(action)
				return vim.startswith(action, "source.")
			end, client.server_capabilities.codeActionProvider.codeActionKinds)

			vim.lsp.buf.code_action({
				context = {
					only = source_actions,
				},
			})
		end, {})
	end,
}
