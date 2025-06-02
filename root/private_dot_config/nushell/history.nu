# module for history settings and keybindings.
# this file should be imported as 'use history.nu []', because the only
# exported symbols are environment variables (including keybindings).

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

const history = {
    file_format:   'sqlite'
    max_size:      1_000_000
    sync_on_enter: true
    isolation:     false
}

export-env {
    $env.config.keybindings ++= [$hint_complete $hint_word_complete]
    $env.config.history = $history
}
