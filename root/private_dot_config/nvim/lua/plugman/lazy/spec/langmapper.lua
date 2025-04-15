local enabled = true

-- source: https://github.com/Wansmer/langmapper.nvim
local function escape(str)
	local escape_chars = [[;,."|\]]
	return vim.fn.escape(str, escape_chars)
end

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

if enabled then
	vim.opt.langmap = vim.fn.join({
		escape(ru_shift) .. ";" .. escape(en_shift),
		escape(ru) .. ";" .. escape(en),
	}, ",")
end

local function config()
	require("langmapper").automapping({
		global = true,
		buffer = true,
	})
end

return {
	"Wansmer/langmapper.nvim",
	cond = enabled,
	name = "langmapper",
	main = "langmapper",
	lazy = false,
	priority = 1,
	opts = {},
	config = config,
}
