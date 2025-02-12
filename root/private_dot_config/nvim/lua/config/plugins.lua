--- @type table<string, Plugin>
local M = {}

--- @class Plugin
---
--- @field name string
--- @field enabled boolean
--- @field config? table | fun(any): table

---@param plugin Plugin
local function add(plugin)
	M[plugin.name] = plugin
end

add({
	name = "catppuccin",
	enabled = true,
	config = require("config.plugins.catppuccin"),
})

add({
	name = "cmp",
	enabled = true,
	config = require("config.plugins.cmp"),
})

add({
	name = "conform",
	enabled = true,
	config = require("config.plugins.conform"),
})

add({
	name = "jdlts",
	enabled = true,
	config = require("config.plugins.jdtls"),
})

add({
	name = "langmapper",
	enabled = true,
	config = require("config.plugins.langmapper"),
})

add({
	name = "lualine",
	enabled = true,
	config = require("config.plugins.lualine"),
})

add({
	name = "mason",
	enabled = true,
	config = require("config.plugins.mason"),
})

add({
	name = "noice",
	enabled = true,
	config = require("config.plugins.noice"),
})

add({
	name = "telescope",
	enabled = true,
	config = require("config.plugins.telescope"),
})

add({
	name = "todo_comments",
	enabled = true,
	config = require("config.plugins.todo_comments"),
})

add({
	name = "treesitter",
	enabled = true,
	config = require("config.plugins.treesitter"),
})

add({
	name = "which_key",
	enabled = true,
	config = require("config.plugins.which_key"),
})

add({
	name = "lint",
	enabled = true,
	config = require("config.plugins.lint"),
})

add({
	name = "lspconfig",
	enabled = true,
	config = require("config.plugins.lspconfig"),
})

return M
