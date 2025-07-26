# source: https://www.nushell.sh/cookbook/external_completers.html#putting-it-all-together

export def carapace []: list<string> -> table {
    ^carapace $in.0 nushell ...$in
    | from json
    | if ($in | is-empty) or ($in.0.value =~ '^.*ERR$') { [] } else { $in }
}

export def expander []: list<string> -> list<string> {
    let spans = $in

    let alias = (
        scope aliases
        | where name == $spans.0
        | get --ignore-errors 0.expansion
    )

    if $alias != null {
        $spans
        | skip 1
        | prepend ($alias | split row ' ' | take 1)
    } else {
        $spans
    }
}

export def completer []: nothing -> closure {
    {|spans: list<string>| $spans | expander | carapace }
}

export def opts []: nothing -> record { {
    enable:      true
    completer:   (completer)
    max_results: 100
} }

export-env {
    $env.config.completions.external = (opts)
}
