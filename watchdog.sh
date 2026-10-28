#!/bin/bash

# Remove any lingering stale PID lock file from previous crashes
rm -f /home/pathak/.urserver/urserver.pid

# Infinite loop to keep urserver alive
while true; do
    if ! pgrep -u "$LOGNAME" -f "/opt/urserver/urserver" > /dev/null; then
        echo "$(date): Process stopped, starting urserver..." >> /home/pathak/.urserver/restart.log
        /opt/urserver/urserver-start >> /home/pathak/.urserver/restart.log 2>&1
    fi
    sleep 10
done
