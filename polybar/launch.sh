#!/bin/bash

# Kill already running polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar (adjust name if needed)
polybar example &
