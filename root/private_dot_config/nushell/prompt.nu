# source: https://github.com/nushell/nushell/blob/main/crates/nu-utils/src/default_files/default_env.nu

# source: https://github.com/nushell/nu_scripts/blob/main/sourced/cool-oneliners/pwd-short.nu
def 'prompt pwd' [] {
    let out = ($env.PWD | str replace $nu.home-path '~')
    return $"(ansi green)($out)(ansi reset)"
}

def 'prompt git' [] {
    let cmd = (git branch --show-current | complete)
    if $cmd.exit_code != 0 {
        return ''
    }

    let out = ($cmd.stdout | str replace "\n" '')
    return $" (ansi blue)@($out)(ansi reset)"
}

def prompt [] {
    $"(prompt pwd)(prompt git)"
}

# hack: https://github.com/nushell/reedline/issues/707

export-env {
    $env.PROMPT_COMMAND             = { prompt }
    $env.PROMPT_COMMAND_RIGHT       = ''
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
