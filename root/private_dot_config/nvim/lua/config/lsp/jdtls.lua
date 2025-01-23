local M = {}

local cfg = require("config.lsp")
local fmt = require("config.fmt")

local workspace_prefix = vim.env.HOME .. "/.cache/jdtls/workspace"
local root_files = {
	".git",
	"gradlew",
	"gradlew.bat",
	"settings.gradle",
	"settings.gradle.kts",
	"pom.xml",
}

local settings = {
	signatureHelp = { enabled = true },
	format = { enabled = fmt.formatting_enabled },
	implementationsCodeLens = { enabled = cfg.lens },
	inlayHints = {
		enabled = cfg.hints,
		parameterNames = {
			enabled = "All",
		},
	},
}

function M.root_dir()
	return vim.fs.root(0, root_files)
end

function M.dir_path(dir)
	return vim.fn.fnamemodify(dir, ":p:h")
end

function M.workspace_dir(path)
	return workspace_prefix .. path
end

function M.cmd(exec, workspace_dir)
	return {
		exec,
		"-data",
		workspace_dir,
	}
end

function M.config(exec)
	local root_dir = M.root_dir()

	return {
		cmd = M.cmd(exec, M.workspace_dir(M.dir_path(root_dir))),
		root_dir = root_dir,
		settings = {
			java = settings,
		},
	}
end

return M
