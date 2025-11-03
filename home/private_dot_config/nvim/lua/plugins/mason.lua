-- INFO: other packages are installed system-wide, check the packages.yaml
return {
	ensure_installed = {
		-- keep-sorted start
		"goimports",
		"golines",
		"hyprls",
		"pyproject-fmt",
		"vue-language-server",
		-- keep-sorted end
	},
}
