--- @type table<string, Plugin>
local M = {}

--- @class Plugin
---
--- @field name string
--- @field enabled boolean
--- @field config? table | fun(any): table

--- @param name string
local function safe_require(name)
	local ok, res = pcall(require, name)

	if ok then
		return res, nil
	else
		return nil, res
	end
end

--- @param plugin Plugin
local function add(plugin)
	if not plugin.config and plugin.enabled then
		local module_name = "config.plugins." .. plugin.name
		local module = safe_require(module_name)

		plugin.config = module or {}
	end

	M[plugin.name] = plugin
end

add({
	name = "catppuccin",
	enabled = true,
})

add({
	name = "cmp",
	enabled = true,
})

add({
	name = "conform",
	enabled = true,
})

add({
	name = "jdlts",
	enabled = true,
})

add({
	name = "langmapper",
	enabled = true,
})

add({
	name = "lualine",
	enabled = true,
})

add({
	name = "mason",
	enabled = true,
})

add({
	name = "noice",
	enabled = true,
})

add({
	name = "telescope",
	enabled = true,
})

add({
	name = "todo_comments",
	enabled = true,
})

add({
	name = "treesitter",
	enabled = true,
})

add({
	name = "which_key",
	enabled = true,
})

add({
	name = "lint",
	enabled = true,
})

add({
	name = "lspconfig",
	enabled = true,
})

add({
	name = "jupytext",
	enabled = true,
})

add({
	name = "quarto",
	enabled = true,
})

add({
	name = "molten",
	enabled = true,
})

add({
	name = "image",
	enabled = true,
})

add({
	name = "silicon",
	enabled = true,
})

return M
