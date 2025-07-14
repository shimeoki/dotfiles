#!/usr/bin/env sh

TMP_DIR="/tmp/rmpc"
[ -d "$TMP_DIR" ] || mkdir "$TMP_DIR"

ALBUM_ART_PATH="$TMP_DIR/cover.jpg"
DEFAULT_ALBUM_ART_PATH="$TMP_DIR/default_cover.jpg"

if ! rmpc albumart --output "$ALBUM_ART_PATH"; then
    ALBUM_ART_PATH="${DEFAULT_ALBUM_ART_PATH}"
fi

MESSAGE="$TITLE - $DURATION\nby $ARTIST"

if [ -n "$ALBUM" ]; then
    MESSAGE="$MESSAGE\nfrom $ALBUM"
fi

if [ -z "$ARTIST" ] || [ -z "$TITLE" ]; then
    MESSAGE="$FILE - $DURATION"
fi

notify-send -a "rmpc" -i "${ALBUM_ART_PATH}" "now playing" "$MESSAGE"
