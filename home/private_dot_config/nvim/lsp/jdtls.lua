-- INFO: sources
-- https://github.com/neovim/nvim-lspconfig/blob/ac98db2f9f06a56498ec890a96928774eae412c3/lsp/jdtls.lua
-- https://codeberg.org/mfussenegger/dotfiles/src/commit/d22c8593a8a8296528c8629d190cbad58371af60/vim/dot-config/nvim/lsp/jdtls.lua
-- https://codeberg.org/mfussenegger/nvim-jdtls

local root_markers = {
	"gradlew",
	"mvnw",
	".git",
}

local function data_dir()
	local project = vim.fs.root(0, root_markers)
	local cache = vim.fn.stdpath("cache") .. "/jdtls/workspace"
	return vim.fn.fnamemodify(cache .. project, ":p:h")
end

local function jvm_args()
	local env = os.getenv("JDTLS_JVM_ARGS")

	local args = {}
	for a in string.gmatch((env or ""), "%S+") do
		local arg = string.format("--jvm-arg=%s", a)
		table.insert(args, arg)
	end

	return unpack(args)
end

--- @type vim.lsp.Config
return {
	--- @param dispatchers? vim.lsp.rpc.Dispatchers
	--- @param config vim.lsp.ClientConfig
	cmd = function(dispatchers, config)
		local config_cmd = {
			"jdtls",
			"-data",
			data_dir(),
			jvm_args(),
		}

		return vim.lsp.rpc.start(config_cmd, dispatchers, {
			cwd = config.cmd_cwd,
			env = config.cmd_env,
			detached = config.detached,
		})
	end,
	filetypes = { "java" },
	root_markers = {
		"gradlew",
		"mvnw",
		".git",
	},
	settings = {
		java = {
			signatureHelp = { enabled = true },
			format = { enabled = true },
			implementationsCodeLens = { enabled = true },
			inlayHints = {
				enabled = true,
				parameterNames = {
					enabled = "All",
				},
			},
		},
	},
}
