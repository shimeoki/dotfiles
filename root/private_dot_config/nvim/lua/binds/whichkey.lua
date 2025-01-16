local M = {}

local function plug()
	return require("which-key")
end

local show_local = {
	"<leader>?",
	function()
		plug().show({ global = false })
	end,
	desc = "buffer local binds",
}

M.list = {
	show_local,
}

return M
