local M = {
	indent = {
		width = 4,
		spaces = true,
		keep = true,
	},
	text = {
		columns = 80,
		scrolloff = 4,
	},
	split = {
		right = true,
		below = true,
	},
	cursor = {
		highlight_line = true,
	},
	relative_numbers = true,
	mouse = false,
	share_clipboard = true,
}

local set = vim.o
local g = vim.g

if not M.mouse then
	set.mouse = ""
	set.mousescroll = "ver:0,hor:0" -- fix: doesn't work
end

if M.share_clipboard then
	set.clipboard = "unnamedplus"
end

set.tabstop = M.indent.width
set.softtabstop = M.indent.width
set.shiftwidth = M.indent.width
set.expandtab = M.indent.spaces

set.number = true
set.relativenumber = M.relative_numbers

-- source: https://stackoverflow.com/a/50415982
set.textwidth = 0
set.wrapmargin = 0
set.wrap = true
set.linebreak = true

set.colorcolumn = tostring(M.text.columns + 1)

set.breakindent = M.indent.keep

set.termguicolors = true

set.scrolloff = M.text.scrolloff

set.signcolumn = "yes"

set.winborder = "solid"

set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.showmode = false
set.showtabline = 0

set.splitright = M.split.right
set.splitbelow = M.split.below

set.cursorline = M.cursor.highlight_line

set.updatetime = 1000

set.shortmess = "ltToOCFsI"
set.cpoptions = "aABceF"

set.undofile = true

g.mapleader = " "
g.maplocalleader = " "

g.markdown_fenced_languages = {
	"ts=typescript",
}

local venv_home = vim.env.VENV_HOME
if venv_home then
	local venv = vim.fn.expand(venv_home .. "/nvim/bin")
	g.python3_host_prog = venv .. "/python3"
end

vim.filetype.add({
	pattern = {
		[".*/.config/hypr/.*%.conf"] = "hyprlang",
		[".*/.config/waybar/.*%.css"] = "gtkcss",
		[".*/.config/wofi/.*%.css"] = "gtkcss",
		[".*/.config/kitty/.*%.conf"] = "kitty",
		[".*/.chezmoiignore"] = "gitignore",
	},
})

return M
