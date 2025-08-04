#!/bin/bash

status=$(playerctl status 2>/dev/null)

case $status in
    "Playing")
        status_icon="▶"
        icon_color="%{F#8FBCBB}"
        ;;
    "Paused")
        status_icon="⏸"
        icon_color="%{F#8FBCBB}"
        ;;
    "Stopped")
        status_icon=""
        icon_color="%{F#BF616A}"
        ;;
    *)
        status_icon="?"
        icon_color="%{F#BF616A}"
        ;;
esac

title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

dynamic=""
if [ -n "$title" ]; then
    dynamic="$title"
fi
if [ -n "$artist" ]; then
    if [ -n "$dynamic" ]; then
        dynamic="$dynamic - $artist"
    else
        dynamic="$artist"
    fi
fi

if [ ${#dynamic} -gt 40 ]; then
    dynamic="${dynamic:0:37}..."
fi

prev_icon="%{A1:playerctl previous:}%{F#8FBCBB}%{F-}%{A}"
next_icon="%{A1:playerctl next:}%{F#8FBCBB}%{F-}%{A}"
toggle_icon="%{A1:playerctl play-pause:}${icon_color}${status_icon}%{F-}%{A}"

if [ -n "$dynamic" ]; then
    echo " $dynamic $prev_icon $toggle_icon $next_icon"
else
    echo " No track info $prev_icon $toggle_icon $next_icon"
fi
