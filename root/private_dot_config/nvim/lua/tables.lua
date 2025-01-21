local M = {}

function M.parse_enabled(tbl)
	local list = {}

	for key, enabled in pairs(tbl) do
		if enabled then
			table.insert(list, key)
		end
	end

	return list
end

function M.parse_filetypes(tbl, enabled)
	local by_filetype = {}

	local keys

	for key, filetypes in pairs(tbl) do
		if enabled and enabled[key] then
			for _, filetype in ipairs(filetypes) do
				keys = by_filetype[filetype]
				if keys == nil then
					by_filetype[filetype] = { key }
				else
					table.insert(keys, key)
				end
			end
		end
	end

	return by_filetype
end

function M.parse_names(map, all)
	local mapped = {}

	local name

	for key, enabled in pairs(all) do
		if enabled then
			name = map[key]
			if not name then
				name = key
			end

			table.insert(mapped, name)
		end
	end

	return mapped
end

return M
