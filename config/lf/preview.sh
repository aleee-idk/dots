#!/bin/sh

# Five arguments are passed to the file:
# (1) current file name
# (2) width
# (3) height
# (4) horizontal position
# (5) vertical position of preview pane

case "$1" in
jpg | jpeg | png) vimiv "$1" ;;
*.tar*) tar tf "$1" ;;
*.zip) unzip -l "$1" ;;
*.rar) unrar l "$1" ;;
*.7z) 7z l "$1" ;;
*.pdf) pdftotext "$1" - ;;
*) bat --force-colorization --line-range ":$3" --pager never --terminal-width "$2" "$1" ;;
esac
