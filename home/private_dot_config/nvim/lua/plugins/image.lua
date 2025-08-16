local opts = {
	backend = "kitty",
	max_width = 128,
	max_height = 16,
	max_height_window_percentage = math.huge,
	max_width_window_percentage = math.huge,
	window_overlap_clear_enabled = true,
	window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
}

return {
	opts = opts,
}
