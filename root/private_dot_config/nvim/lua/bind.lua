--- @class Bind
--- @field modes string
--- @field keys string
--- @field cmd string
--- @field desc string
--- @field silent boolean
local Bind = {}
Bind.__index = Bind

local bytes = string.byte
local char = string.char

--- @param str string
--- @return table
local function split(str)
	local codes = { bytes(str, 1, #str) }

	local chars = {}
	for i = 1, #codes do
		chars[i] = char(codes[i])
	end

	return chars
end

function Bind.new(modes, keys, cmd, desc)
	local self = setmetatable({}, Bind)

	self.modes = modes
	self.keys = "<leader>" .. keys
	self.cmd = "<cmd>" .. cmd .. "<cr>"
	self.desc = desc
	self.silent = true -- hack: temporary fix

	return self
end

function Bind:to_std()
	return self:mode_table(), self.keys, self.cmd, {
		desc = self.desc,
		silent = self.silent,
	}
end

function Bind:to_which_key()
	return {
		self.keys,
		self.cmd,
		desc = self.desc,
		mode = self:mode_table(),
	}
end

function Bind:to_lazy()
	return {
		self.keys,
		self.cmd,
		mode = self:mode_table(),
		desc = self.desc,
	}
end

function Bind:mode_table()
	return split(self.modes)
end

function Bind:apply()
	vim.keymap.set(self:to_std())
end

return Bind
