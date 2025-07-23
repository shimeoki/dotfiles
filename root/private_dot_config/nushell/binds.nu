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
    keycode: 'char_;'
    mode: $modes
    event: { send: HistoryHintComplete }
}

const hint_word_complete = {
    name: hint_word_complete
    modifier: control
    keycode: char_l
    mode: $modes
    event: { send: HistoryHintWordComplete }
}

const clear = {
    name: clear
    modifier: control
    keycode: char_u
    mode: $modes
    event: { edit: Clear }
}

const clear_screen = {
    name: clear_screen
    modifier: control
    keycode: backspace
    mode: $modes
    event: { send: ClearScreen }
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

const v = {
    name: v
    modifier: control
    keycode: char_v
    mode: $modes
    event: {
        send: ExecuteHostCommand
        cmd: v
    }
}

const rmpc = {
    name: rmpc
    modifier: control
    keycode: char_m
    mode: $modes
    event: {
        send: ExecuteHostCommand
        cmd: rmpc
    }
}

export-env {
    $env.config.keybindings ++= [
        $menu_down
        $menu_up
        $hint_complete
        $hint_word_complete
        $clear
        $clear_screen
        $fv
        $fj
        $fc
        $y
        $lg
        $czj
        $v
        $rmpc
    ]
}
