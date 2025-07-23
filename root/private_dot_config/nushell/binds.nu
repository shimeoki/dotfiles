$env.config.keybindings ++= [
    {
        name: menu_down
        modifier: control
        keycode: char_j
        mode: [vi_normal vi_insert]
        event: { send: MenuDown }
    }
    {
        name: menu_up
        modifier: control
        keycode: char_k
        mode: [vi_normal vi_insert]
        event: { send: MenuUp }
    }
    {
        name: hint_word_complete
        modifier: control
        keycode: char_l
        mode: [vi_normal vi_insert]
        event: { send: HistoryHintWordComplete }
    }
    {
        name: hint_complete
        modifier: control
        keycode: 'char_;'
        mode: [vi_normal vi_insert]
        event: { send: HistoryHintComplete }
    }
    {
        name: clear
        modifier: control
        keycode: char_u
        mode: [vi_normal vi_insert]
        event: { edit: Clear }
    }
    {
        name: clear_screen
        modifier: control
        keycode: backspace
        mode: [vi_normal vi_insert]
        event: { send: ClearScreen }
    }
]

use modules/yazi.nu
$env.config.keybindings ++= [
    {
        name: yazi
        modifier: control
        keycode: char_e
        mode: [vi_normal vi_insert]
        event: {
            send: ExecuteHostCommand
            cmd: 'yazi cwd-on-exit'
        }
    }
]

use modules/fzf.nu
$env.config.keybindings ++= [
    {
        name: fzf_editor
        modifier: control
        keycode: char_f
        mode: [vi_normal vi_insert]
        event: {
            send: ExecuteHostCommand
            cmd: 'fzf editor'
        }
    }
    {
        name: fzf_jump
        modifier: control_shift
        keycode: char_f
        mode: [vi_normal vi_insert]
        event: {
            send: ExecuteHostCommand
            cmd: 'fzf jump'
        }
    }
    {
        name: fzf_copy
        modifier: control
        keycode: char_t
        mode: [vi_normal vi_insert]
        event: {
            send: ExecuteHostCommand
            cmd: 'fzf copy'
        }
    }
]

$env.config.keybindings ++= [
    {
        name: lazygit
        modifier: control
        keycode: char_g
        mode: [vi_normal vi_insert]
        event: {
            send: ExecuteHostCommand
            cmd: lazygit
        }
    }
    {
        name: chezmoi
        modifier: control
        keycode: char_z
        mode: [vi_normal vi_insert]
        event: {
            send: ExecuteHostCommand
            cmd: 'chezmoi cd'
        }
    }
    {
        name: nvim
        modifier: control
        keycode: char_v
        mode: [vi_normal vi_insert]
        event: {
            send: ExecuteHostCommand
            cmd: nvim
        }
    }
    {
        name: rmpc
        modifier: control
        keycode: char_m
        mode: [vi_normal vi_insert]
        event: {
            send: ExecuteHostCommand
            cmd: rmpc
        }
    }
]
