#!/bin/bash

# Terminate already running bar instances
pkill polybar -9

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get connected monitors
monitors=($(xrandr --query | grep " connected" | cut -d" " -f1))

echo "Connected monitors: ${monitors[@]}"

# Launch bars for each connected monitor
for i in "${!monitors[@]}"; do
    if [ $i -eq 0 ]; then
        # First monitor gets the main bar
        echo "Launching main bar on ${monitors[$i]}"
        MONITOR=${monitors[$i]} polybar main --config=~/.config/polybar/config.ini &
    else
        # Additional monitors get the second bar
        echo "Launching second bar on ${monitors[$i]}"
        MONITOR=${monitors[$i]} polybar second --config=~/.config/polybar/config.ini &
    fi
done

echo "Polybar launched..."
