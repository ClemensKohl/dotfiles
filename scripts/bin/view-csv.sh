#!/usr/bin/env bash
# Author: Benjamin Oakes <hello@benjaminoakes.com>
set -o errexit

function show_usage {
  cat <<EOF
  Usage: $0 [--help] [filename]

  View a CSV file at the command line.

  --help        Show this help text.
  filename      CSV file to be viewed
EOF
  exit -1
}

if [ "$1" == "--help" -o "$1" == "" ]; then
  show_usage
fi

cat "$1" | column -s, -t | less -#2 -N -S
