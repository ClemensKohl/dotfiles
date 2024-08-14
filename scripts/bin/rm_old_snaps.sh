#!/bin/bash
# Removes old revisions of snaps
# https://superuser.com/questions/1310825/how-to-remove-old-version-of-installed-snaps/1330590#1330590
# CLOSE ALL SNAPS BEFORE RUNNING THIS

# You might also want to limit how many revisions are kept.
# To set it to two (needs to be between 2 and 20):
# sudo snap set system refresh.retain=2
#
set -eu

LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
