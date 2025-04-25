--- @param module string
return function(module)
	local ok, res = pcall(require, module)
	if ok then
		return res
	else
		return nil, res
	end
end
