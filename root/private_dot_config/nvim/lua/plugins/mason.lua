local ensure_installed = {}

local function add_installed(tools)
	for _, key in ipairs(tools) do
		table.insert(ensure_installed, key)
	end
end

add_installed(require("langservers").by_group.mason)
add_installed(require("linters").by_group.mason)
add_installed(require("formatters").by_group.mason)

local opts = {
	ensure_installed = ensure_installed,
}

return {
	opts = opts,
}
