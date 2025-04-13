vim.filetype.add({
	pattern = {
		[".*/.config/hypr/.*%.conf"] = "hyprlang",
		[".*/.config/waybar/.*%.css"] = "gtkcss",
		[".*/.config/kitty/.*%.conf"] = "kitty",
	},
})
