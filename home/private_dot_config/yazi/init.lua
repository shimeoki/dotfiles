require("full-border"):setup({
	type = ui.Border.PLAIN,
})

require("git"):setup()

require("relative-motions"):setup({
	show_numbers = "relative_absolute",
})

function Status:name()
	local h = self._tab.current.hovered
	if not h then
		return ui.Line({})
	end

	local linked = ""
	if h.link_to ~= nil then
		linked = " -> " .. tostring(h.link_to)
	end

	return ui.Line(" " .. h.name .. linked)
end
