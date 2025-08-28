#!/bin/bash
# Kill the kmonad process
if [ -f /tmp/kmonad-disable.pid ]; then
    kill $(cat /tmp/kmonad-disable.pid) 2>/dev/null
    rm /tmp/kmonad-disable.pid
fi
pkill -f "kmonad.*disable-internal"
echo "Internal keyboard enabled"
