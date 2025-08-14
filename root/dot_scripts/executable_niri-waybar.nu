#!/usr/bin/env nu

let waybar = (ps | where name == 'waybar' | get --optional 0)

niri msg action do-screen-transition

if ($waybar == null) {
    waybar
} else {
    kill $waybar.pid
}
