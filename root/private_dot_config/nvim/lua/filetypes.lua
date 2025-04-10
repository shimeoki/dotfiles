vim.filetype.add({
	pattern = {
		[".*/hypr/.*%.conf"] = "hyprlang",
		[".*/waybar/.*%.css"] = "gtkcss",
	},
})
