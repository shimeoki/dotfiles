#!/usr/bin/env nu

niri msg --json windows
| from json
| each {|w| $"($w.id)\t($w.title) / ($w.app_id)" }
| to text
| fuzzel --dmenu --accept-nth=1
| if ($in | is-not-empty) { niri msg action focus-window --id $in }
