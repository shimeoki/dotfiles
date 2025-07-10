const modes = [vi_normal vi_insert]

const menu_down = {
    name: menu_down
    modifier: control
    keycode: char_j
    mode: $modes
    event: { send: MenuDown }
}

const menu_up = {
    name: menu_up
    modifier: control
    keycode: char_k
    mode: $modes
    event: { send: MenuUp }
}

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

const fv = {
    name: fv
    modifier: control
    keycode: char_f
    mode: $modes
    event: {
        send: ExecuteHostCommand
        cmd: fv
    }
}

const fj = {
    name: fj
    modifier: control_shift
    keycode: char_f
    mode: $modes
    event: {
        send: ExecuteHostCommand
        cmd: fj
    }
}

const fc = {
    name: fc
    modifier: control
    keycode: char_t
    mode: $modes
    event: {
        send: ExecuteHostCommand
        cmd: fc
    }
}

const y = {
    name: y
    modifier: control
    keycode: char_e
    mode: $modes
    event: {
        send: ExecuteHostCommand
        cmd: y
    }
}

const lg = {
    name: lg
    modifier: control
    keycode: char_g
    mode: $modes
    event: {
        send: ExecuteHostCommand
        cmd: lg
    }
}

const czj = {
    name: czj
    modifier: control
    keycode: char_z
    mode: $modes
    event: {
        send: ExecuteHostCommand
        cmd: czj
    }
}

export-env {
    $env.config.keybindings ++= [
        $menu_down
        $menu_up
        $hint_complete
        $hint_word_complete
        $fv
        $fj
        $fc
        $y
        $lg
        $czj
    ]
}
