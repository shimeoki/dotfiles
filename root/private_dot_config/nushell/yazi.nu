# module for yazi related functions or aliases.
# this file should be imported as 'use yazi.nu *' to import aliases.

def --env --wrapped yazi-cwd [...rest: string]: nothing -> nothing {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")

	yazi --cwd-file $tmp ...$rest

	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}

	rm -fp $tmp
}

export alias y = yazi-cwd
