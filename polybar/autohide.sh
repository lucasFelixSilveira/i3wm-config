#!/bin/bash

BAR_HEIGHT=35
VISIBLE=1

while true; do
    Y=$(xdotool getmouselocation --shell | grep '^Y=' | cut -d= -f2)

    if [ "$Y" -le 10 ]; then
        if [ "$VISIBLE" -eq 0 ]; then
            polybar-msg cmd show >/dev/null
            VISIBLE=1
        fi
    else
        if [ "$VISIBLE" -eq 1 ]; then
            polybar-msg cmd hide >/dev/null
            VISIBLE=0
        fi
    fi

    sleep 0.1
done
