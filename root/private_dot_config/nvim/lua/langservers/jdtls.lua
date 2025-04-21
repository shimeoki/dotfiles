local workspace_prefix = vim.env.HOME .. "/.cache/jdtls/workspace"

local root_files = {
	".git",
	"gradlew",
	"gradlew.bat",
	"settings.gradle",
	"settings.gradle.kts",
	"pom.xml",
}

-- todo: get parameters?
local settings = {
	signatureHelp = { enabled = true },
	format = { enabled = true },
	implementationsCodeLens = { enabled = true },
	inlayHints = {
		enabled = true,
		parameterNames = {
			enabled = "All",
		},
	},
}

local function rootdir()
	return vim.fs.root(0, root_files)
end

local function dirpath(dir)
	return vim.fn.fnamemodify(dir, ":p:h")
end

local function workdir(path)
	return workspace_prefix .. path
end

local function cmd(exec, workspace_dir)
	return {
		exec,
		"-data",
		workspace_dir,
	}
end

return function(exec)
	local root_dir = rootdir()

	return {
		cmd = cmd(exec, workdir(dirpath(root_dir))),
		root_dir = root_dir,
		settings = {
			java = settings,
		},
	}
end
