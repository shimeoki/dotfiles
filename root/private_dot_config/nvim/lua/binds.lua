local M = {}

local Bind = require("bind")

local std = {
	-- change cwd
	Bind.new("nv", "`", "cd %:p:h", "change current working directory to file's"),
	-- file management
	Bind.new("nv", "u", "w", "save current file"),
	Bind.new("nv", "U", "wall", "save all files"),
	-- split focus
	Bind.new("nv", "h", "wincmd h", "focus left split"),
	Bind.new("nv", "j", "wincmd j", "focus bottom split"),
	Bind.new("nv", "k", "wincmd k", "focus top split"),
	Bind.new("nv", "l", "wincmd l", "focus right split"),
	-- split swap
	Bind.new("nv", "H", "wincmd H", "swap split to left"),
	Bind.new("nv", "J", "wincmd J", "swap split to bottom"),
	Bind.new("nv", "K", "wincmd K", "swap split to top"),
	Bind.new("nv", "L", "wincmd L", "swap split to right"),
	-- split resize
	Bind.new("nv", "<c-h>", "4wincmd <", "decrease split width"),
	Bind.new("nv", "<c-j>", "4wincmd -", "decrease split height"),
	Bind.new("nv", "<c-k>", "4wincmd +", "increase split width"),
	Bind.new("nv", "<c-l>", "4wincmd >", "increase split width"),
	-- split current
	Bind.new("nv", "'", "vsplit", "split horizontally current"),
	Bind.new("nv", ";", "split", "split vertically current"),
	-- split new
	Bind.new("nv", '"', "vnew", "split horizontally new"),
	Bind.new("nv", ":", "new", "split vertically new"),
	-- open
	Bind.new("nv", "<enter>", "vsplit", "open current"),
	Bind.new("nv", "<s-enter>", "vnew", "open new"),
	-- close
	Bind.new("nv", "<bs>", "quit", "close current split"),
	Bind.new("nv", "<s-bs>", "only", "close all except current split"),
	Bind.new("nv", "<c-bs>", "bdelete", "close current buffer"),
	-- focus relative
	Bind.new("nv", "[", "-wincmd w", "focus previous split"),
	Bind.new("nv", "]", "+wincmd w", "focus next split"),
	-- swap relative
	Bind.new("nv", "{", "wincmd R", "swap split with next"),
	Bind.new("nv", "}", "wincmd r", "swap split with previous"),
	-- lsp
	Bind.new("nv", "i", "lua vim.lsp.buf.hover()", "show symbol information"),
	Bind.new("nv", "I", "lua vim.lsp.buf.signature_help()", "show symbol signature help"),
	Bind.new("nv", "a", "lua vim.lsp.buf.code_action()", "list code actions"),
	Bind.new("nv", "N", "lua vim.lsp.buf.rename()", "rename symbol"),
	-- other lsp actions are done with telescope
	-- comments
	Bind.new("n", "c", 'lua vim.api.nvim_input("gcc")', "toggle comment"),
	Bind.new("v", "c", 'lua vim.api.nvim_input("gc")', "toggle comment"),
}

local yazi = {
	Bind.new("nv", "e", "Yazi", "open yazi at the current file"),
	Bind.new("nv", "E", "Yazi cwd", "open yazi in current working directory"),
	Bind.new("nv", "<c-e>", "Yazi toggle", "resume last yazi session"),
}

local t = "Telescope "
local telescope = {
	-- file navigation
	Bind.new("nv", "f", t .. "find_files", "find files"),
	Bind.new("nv", "F", t .. "live_grep", "live grep fils"),
	-- check current or previous files
	Bind.new("nv", "b", t .. "buffers", "list buffers"),
	Bind.new("nv", "B", t .. "oldfiles", "list old files"),
	-- commands
	Bind.new("nv", "r", t .. "commands", "list commands"),
	Bind.new("nv", "<c-r>", t .. "command_history", "show command history"),
	-- registers
	Bind.new("nv", "v", t .. "registers", "list registers"),
	-- search in file
	Bind.new("nv", "/", t .. "current_buffer_fuzzy_find", "fuzzy find in buffer"),
	-- lsp
	Bind.new("nv", "n", t .. "lsp_references", "list symbol references"),
	Bind.new("nv", "d", t .. "diagnostics bufnr=0", "list buffer diagnostics"),
	Bind.new("nv", "D", t .. "diagnostics", "list workspace diagnostics"),
	Bind.new("nv", "s", t .. "lsp_document_symbols", "list buffer symbols"),
	Bind.new("nv", "S", t .. "lsp_workspace_symbols", "list workspace symbols"),
	Bind.new("nv", "t", t .. "lsp_definitions", "list symbol definitions"),
	Bind.new("nv", "T", t .. "lsp_implementations", "list symbol implementations"),
	Bind.new("nv", "<c-t>", t .. "lsp_type_definitions", "list symbol type definitions"),
	-- git
	Bind.new("nv", "g", t .. "git_commits", "list commits"),
	Bind.new("nv", "G", t .. "git_branches", "list branches"),
}

local q = 'lua require("quarto.runner").'
local quarto = {
	Bind.new("n", "q", q .. "run_cell()", "run cell with quarto"),
	Bind.new("v", "q", q .. "run_range()", "run visual range with quarto"),
	Bind.new("nv", "Q", q .. "run_above()", "run cell and above with quarto"),
	Bind.new("nv", "<c-q>", q .. "run_all()", "run all cells with quarto"),
}

M.map = {
	std = std,
	yazi = yazi,
	telescope = telescope,
	quarto = quarto,
}

function M.convert(tbl, format)
	local binds = {}
	local callback

	if format == "which_key" then
		callback = Bind.to_which_key
	elseif format == "lazy" then
		callback = Bind.to_lazy
	else
		-- todo: logging?
		return binds
	end

	for _, bind in ipairs(tbl) do
		table.insert(binds, callback(bind))
	end

	return binds
end

for _, bind in ipairs(std) do
	bind:apply()
end

return M
