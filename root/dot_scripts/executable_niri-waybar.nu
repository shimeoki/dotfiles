#!/usr/bin/env nu

let waybar = (systemctl --user status waybar | complete)

niri msg action do-screen-transition

if ($waybar.exit_code == 0) {
    systemctl --user stop waybar
} else {
    systemctl --user start waybar
}
