# module for the prompt.
# this file should be imported as 'use prompt.nu []', because the only exported
# symbols are envs.

# source: https://github.com/nushell/nushell/blob/main/crates/nu-utils/src/default_files/default_env.nu

# source: https://github.com/nushell/nu_scripts/blob/main/sourced/cool-oneliners/pwd-short.nu
def 'prompt pwd' [] {
    let out = ($env.PWD | str replace $nu.home-dir '~')
    let color = if $env.LAST_EXIT_CODE == 0 { "green" } else { "red" }
    $"(ansi $color)($out)(ansi reset)"
}

def 'prompt git' [] {
    let status = (git status --short | complete)
    let lines = ($status.stdout | lines)
    if ($lines | length) < 1 { return '' }

    mut color = 'blue'

    let delta = if ($lines | length) > 1 { '~' } else { '' }
    let cols = ($lines | get 0 | split column '...' | get 0)
    let name = ($cols | get column0 | parse '## {branch}' | get branch.0)
    let branch = $'($name)($delta)'

    let upstream = ($cols | get --optional column2)
    if ($upstream | is-empty) { return $'(ansi $color)($branch)(ansi reset)' }

    let diff = ($upstream | parse --regex '\[(?:ahead (?<ahead>\d+))?(?:, )?(?:behind (?<behind>\d+))?\]')
    let ahead = ($diff | get --optional ahead.0)
    let behind = ($diff | get --optional behind.0)

    let plus = if ($ahead | is-empty) { '' } else {
        $color = 'cyan'
        $'+($ahead)'
    }

    let minus = if ($behind | is-empty) { '' } else {
        $color = 'yellow'
        $'-($behind)'
    }

    let status = (
        $'($plus) ($minus)'
        | str trim | if ($in | is-empty) { '= ' } else { $'($in) ' }
    )

    $'(ansi $color)($status)($branch)(ansi reset)'
}

def 'prompt time' [] {
    let time = ($env.CMD_DURATION_MS | into int | into duration --unit ms)
    if $time < 5sec { return '' }

    let color = "light_gray"
    $"(ansi $color)($time)(ansi reset)"
}

def env-exists [name: string] {
    $env | get --optional $name | is-not-empty
}

def 'prompt sub' [] {
    let nix = if (env-exists IN_NIX_SHELL) { 'nix' } else { '' }
    let yazi = if (env-exists YAZI_LEVEL) { 'yazi' } else { '' }

    let parts = ([ $nix $yazi ] | compact --empty)
    if ($parts | is-empty) { return '' }

    let color = 'light_gray'
    $"(ansi $color)\(($parts | str join ', ')\)(ansi reset)"
}

def prompt [] {
    $"(prompt sub) (prompt pwd) (prompt git)" | str trim
}

# hack: https://github.com/nushell/reedline/issues/707

export-env {
    $env.PROMPT_COMMAND             = { prompt }
    $env.PROMPT_COMMAND_RIGHT       = { prompt time }
    $env.PROMPT_INDICATOR           = " \n$ "
    $env.PROMPT_INDICATOR_VI_NORMAL = " \n: "
    $env.PROMPT_INDICATOR_VI_INSERT = " \n> "
    $env.PROMPT_MULTILINE_INDICATOR = '~ '

    $env.TRANSIENT_PROMPT_COMMAND             = ''
    $env.TRANSIENT_PROMPT_COMMAND_RIGHT       = ''
    $env.TRANSIENT_PROMPT_INDICATOR           = '$ '
    $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = ': '
    $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = '> '
    $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = ''
}
