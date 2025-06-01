const modes = [vi_normal vi_insert]

const hint_complete = {
    name: hint_complete
    modifier: control
    keycode: char_h
    mode: $modes
    event: { send: HistoryHintComplete }
}

const hint_word_complete = {
    name: hint_word_complete
    modifier: control
    keycode: char_u
    mode: $modes
    event: { send: HistoryHintWordComplete }
}

export-env {
    $env.config.keybindings = $env.config.keybindings
    | append [$hint_complete $hint_word_complete]

    $env.config.history = {
        file_format:   'sqlite'
        max_size:      1_000_000
        sync_on_enter: true
        isolation:     false
    }
}
