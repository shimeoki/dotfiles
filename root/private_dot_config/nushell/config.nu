# theme

source ($nu.default-config-dir | path join 'themes' 'catppuccin-mocha.nu')

# zoxide

source ~/.zoxide.nu

# yazi

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}
