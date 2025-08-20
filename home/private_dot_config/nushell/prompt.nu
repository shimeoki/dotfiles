# module for the prompt.
# this file should be imported as 'use prompt.nu []', because the only exported
# symbols are envs.

# source: https://github.com/nushell/nushell/blob/main/crates/nu-utils/src/default_files/default_env.nu

# source: https://github.com/nushell/nu_scripts/blob/main/sourced/cool-oneliners/pwd-short.nu
def 'prompt pwd' [] {
    let out = ($env.PWD | str replace $nu.home-path '~')

    let color = if $env.LAST_EXIT_CODE == 0 {
        "green"
    } else {
        "red"
    }

    $"(ansi $color)($out)(ansi reset)"
}

def 'prompt git' [] {
    let cmd = (git branch --show-current | complete)
    if $cmd.exit_code != 0 {
        return ''
    }

    let revs = (
        git rev-list --left-right --count HEAD...@{upstream} | complete
    )

    let branch = ($cmd.stdout | str replace "\n" '')
    let color = 'blue'

    if $revs.exit_code != 0 {
        return $"(ansi $color)($branch)(ansi reset)"
    }

    let diffs = ($revs.stdout | split column --regex '\s+')
    let ahead = ($diffs | get column1.0 | into int)
    let behind = ($diffs | get column2.0 | into int)

    let color = if $behind > 0 {
        'yellow'
    } else if $ahead > 0 {
        'cyan'
    } else {
        $color
    }

    let plus = if $ahead == 0 {
        ''
    } else {
        $"+($ahead)"
    }

    let minus = if $behind == 0 {
        ''
    } else {
        $"-($behind)"
    }

    let status = (
        $"($plus) ($minus)"
        | str trim
        | if ($in | is-empty) { '=' } else { $in }
    )

    $"(ansi $color)($status) ($branch)(ansi reset)" | str trim
}

def 'prompt time' [] {
    let time = ($env.CMD_DURATION_MS | into int | into duration --unit ms)
    if $time < 5sec {
        return ''
    }

    let color = "light_gray"

    $"(ansi $color)($time)(ansi reset)"
}

def prompt [] {
    $"(prompt pwd) (prompt git)" | str trim
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
