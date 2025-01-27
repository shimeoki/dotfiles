--- @alias group string
--- @alias alias string
--- @alias name string

--- @class Tool
---
--- @field name name
--- @field enabled boolean
--- @field aliases? table<group, alias>
--- @field filetypes string[]
--- @field config? table | fun(any): table

--- @class ToolBox
---
--- @field opts? table
--- @field map table<name, Tool>
--- @field enabled Tool[]
--- @field by_filetype table<string, name[]>
--- @field groups table<group, boolean>
--- @field by_group? table<group, alias[]>
local ToolBox = {}
ToolBox.__index = ToolBox

--- @param opts table
---
--- @return ToolBox
function ToolBox.new(opts)
	local self = setmetatable({}, ToolBox)

	self.opts = opts
	self.map = {}
	self.enabled = {}
	self.by_filetype = {}
	self.groups = {}

	return self
end

--- @param tool Tool
function ToolBox:add(tool)
	tool.aliases = tool.aliases or {}

	self.map[tool.name] = tool

	if not tool.enabled then
		return
	end

	table.insert(self.enabled, tool)

	local tools
	for _, filetype in ipairs(tool.filetypes) do
		tools = self.by_filetype[filetype]
		if not tools then
			self.by_filetype[filetype] = { tool.name }
		else
			table.insert(tools, tool.name)
		end
	end

	for group, _ in pairs(tool.aliases) do
		self.groups[group] = true
	end
end

--- @param groups? group[]
function ToolBox:parse_groups(groups)
	self.by_group = {}

	if groups then
		for _, group in ipairs(groups) do
			self.groups[group] = true
		end
	end

	local alias, tools
	for name, tool in pairs(self.map) do
		for group, _ in pairs(self.groups) do
			alias = tool.aliases[group] or name

			tools = self.by_group[group]
			if not tools then
				self.by_group[group] = { alias }
			else
				table.insert(tools, alias)
			end
		end
	end
end

return ToolBox
