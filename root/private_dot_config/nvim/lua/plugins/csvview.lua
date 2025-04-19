local enabled = true

local opts = {
	parser = { comments = { "#", "//" } },
	view = { display_mode = "border" },
	keymaps = {
		textobject_field_inner = { "if", mode = { "o", "x" } },
		textobject_field_outer = { "af", mode = { "o", "x" } },
		jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
		jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
		jump_next_row = { "<Enter>", mode = { "n", "v" } },
		jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
	},
}

return {
	"hat0uma/csvview.nvim",
	cond = enabled,
	main = "csvview",
	lazy = true,
	opts = opts,
	cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
}
