#!/bin/bash
if pgrep -f "kmonad.*disable-internal" > /dev/null; then
    ~/bin/enable-internal-keyboard.sh
else
    ~/bin/disable-internal-keyboard.sh
fi
