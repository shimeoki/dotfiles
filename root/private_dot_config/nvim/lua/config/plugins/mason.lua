local M = {}

M.home = vim.env.HOME .. "/.local/share/nvim/mason"

local ensure_installed = {}

local function add_installed(tools)
	for _, key in ipairs(tools) do
		table.insert(ensure_installed, key)
	end
end

add_installed(require("config.langservers").by_group.mason)
add_installed(require("config.linters").by_group.mason)
add_installed(require("config.formatters").by_group.mason)

M.opts = {
	ui = {
		border = "rounded",
	},
}

M.installer_opts = {
	ensure_installed = ensure_installed,
}

return M
