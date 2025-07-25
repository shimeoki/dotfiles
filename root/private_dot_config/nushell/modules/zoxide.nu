# module for zoxide usage in nushell.
# it's a rewrite of standard (official) zoxide script for nushell.
# it also exports some environment variables to setup hooks.

# source: https://github.com/ajeetdsouza/zoxide

def trim []: string -> string { $in | str trim -r -c "\n" }

def wrap-path [segments: list<string>]: nothing -> string {
    match $segments {
        [] => { '~' },
        ['-'] => { '-' },
        [$arg] if ($arg | path type) == 'dir' => { $arg }
        _ => { zoxide query --exclude $env.PWD -- ...$segments | trim }
    }
}

export def --env --wrapped jump [...rest: string]: nothing -> nothing {
    cd (wrap-path $rest)
}

export def --env --wrapped jumper [...rest: string]: nothing -> nothing {
    cd $'(zoxide query --interactive -- ...$rest | trim)'
}

def --env init-hooks []: nothing -> nothing {
    $env.config = $env.config?
    | default {}
    | upsert hooks { default {} }
    | upsert hooks.env_change { default {} }
    | upsert hooks.env_change.PWD { default [] }
}

def hooked []: nothing -> bool { (
    $env.config.hooks.env_change.PWD
    | any { try { get zoxide } catch { false } }
) }

def --env hook []: nothing -> nothing {
    $env.config.hooks.env_change.PWD ++= [{
        zoxide: true,
        code: {|_, dir| zoxide add -- $dir }
    }]
}

export-env { init-hooks; if not (hooked) { hook } }
