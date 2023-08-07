#!/bin/bash

# Given a txt file name from the map folder.

TXT_FILE="$1"
HTML_FILE="$2"

echo "Reading input TXT file $TXT_FILE to produce an update output HTML file $HTML_FILE"

# Use my C++ program since the AWK command does not work:
cat "$TXT_FILE" \
| sed 's/function PreloadFiles takes nothing returns nothing//' \
| sed 's/\tcall PreloadStart()//' \
| sed 's/\tcall Preload( \"//' \
| sed 's/\" )//' \
| sed 's/endfunction//' \
| sed 's/\tcall PreloadEnd( .* )//' \
| sed '/^$/d' \
| ./formatmapdata "$HTML_FILE"
