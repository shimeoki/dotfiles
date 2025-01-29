local M = {}

M.home = vim.env.HOME .. "/.local/share/nvim/mason"

local ensure_installed = {}

local langservers = require("config.langservers")
for _, key in ipairs(langservers.by_group.mason) do
	table.insert(ensure_installed, key)
end

local linters = require("config.linters")
for _, key in ipairs(linters.by_group.mason) do
	table.insert(ensure_installed, key)
end

M.opts = {
	ui = {
		border = "rounded",
	},
}

M.installer_opts = {
	ensure_installed = ensure_installed,
}

return M
