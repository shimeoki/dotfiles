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

local set = vim.opt

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

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

set.termguicolors = true

set.scrolloff = M.text.scrolloff

set.signcolumn = "yes"

-- warn: don't uncomment this, because many apps will have a double border
-- because of this
--
-- set.winborder = "rounded"

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

vim.g.mapleader = " "
vim.g.maplocalleader = " " -- subject to change

vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

local venv_home = vim.env.VENV_HOME
if venv_home then
	local venv = vim.fn.expand(vim.env.VENV_HOME .. "/nvim/bin")
	vim.g.python3_host_prog = venv .. "/python3"
end

vim.g.lazygit_floating_window_scaling_factor = 0.95

-- hack: workaround for "buffer newer than edits"
-- source: https://github.com/neovim/neovim/issues/12970#issuecomment-1166957212

vim.lsp.util.apply_text_document_edit = function(text_document_edit, _, offset_encoding)
	local text_document = text_document_edit.textDocument
	local bufnr = vim.uri_to_bufnr(text_document.uri)

	if offset_encoding == nil then
		vim.notify_once("apply_text_document_edit must be called with valid offset encoding", vim.log.levels.WARN)
	end

	vim.lsp.util.apply_text_edits(text_document_edit.edits, bufnr, offset_encoding)
end

return M
