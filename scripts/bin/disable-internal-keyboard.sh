#!/bin/bash
# Kill any existing kmonad instance
pkill -f "kmonad.*disable-internal"

# Start kmonad with the disable config
kmonad ~/.config/kmonad/disable-internal.kbd &
echo "Internal keyboard disabled (kmonad PID: $!)"
echo $! > /tmp/kmonad-disable.pid
