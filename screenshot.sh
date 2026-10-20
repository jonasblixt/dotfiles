#!/bin/sh
# Take a screenshot with ImageMagick and put it on the clipboard.
#
# Usage: screenshot.sh [-f] [-r]
#   -f  save to screenshot-<timestamp>.png instead of the clipboard
#   -r  capture the whole screen instead of a selected region

usage() {
  echo "Usage: $0 [-f] [-r]"
  exit 2
}

command -v import > /dev/null || { echo "ImageMagick is not installed!"; exit 1; }
command -v xclip > /dev/null || { echo "xclip is not installed!"; exit 1; }

root_window=0
to_file=0

while getopts fr opt; do
  case "$opt" in
    f) to_file=1 ;;
    r) root_window=1 ;;
    *) usage ;;
  esac
done

if [ "$root_window" -eq 1 ]; then
  set -- -window root
else
  set --
fi

if [ "$to_file" -eq 1 ]; then
  import "$@" "screenshot-$(date +%Y%m%d%H%M%S).png"
else
  import "$@" png:- | xclip -selection clipboard -t image/png
fi
