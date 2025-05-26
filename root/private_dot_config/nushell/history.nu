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

$env.config.keybindings = $env.config.keybindings
| append [$hint_complete $hint_word_complete]
