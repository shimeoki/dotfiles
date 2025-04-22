local settings = {
	hints = {
		rangeVariableTypes = true,
		parameterNames = true,
		constantValues = true,
		assignVariableTypes = true,
		compositeLiteralFields = true,
		compositeLiteralTypes = true,
		functionTypeParameters = true,
	},
}

local opts = {
	settings = {
		gopls = settings,
	},
}

return {
	opts = opts,
}
