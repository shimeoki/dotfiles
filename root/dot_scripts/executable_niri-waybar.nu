#!/usr/bin/env nu

let waybar = (systemctl --user status waybar | complete)

if ($waybar.exit_code == 0) {
    niri msg action do-screen-transition --delay-ms 100
    systemctl --user stop waybar
} else {
    niri msg action do-screen-transition --delay-ms 1000
    systemctl --user start waybar
}
