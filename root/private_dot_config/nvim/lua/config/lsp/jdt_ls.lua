local M = {}

local cfg = require("config.mason")
local exec = cfg.home .. "/bin/jdtls"
local workspace_prefix = vim.env.HOME .. "/.cache/jdtls/workspace"
local root_files = {
	".git",
	"gradlew",
	"gradlew.bat",
	"settings.gradle",
	"settings.gradle.kts",
	"pom.xml",
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

function M.cmd(workspace_dir)
	return {
		exec,
		"-data",
		workspace_dir,
	}
end

function M.config()
	local root_dir = M.root_dir()

	return {
		cmd = M.cmd(M.workspace_dir(M.dir_path(root_dir))),
		root_dir = root_dir,
	}
end

return M
