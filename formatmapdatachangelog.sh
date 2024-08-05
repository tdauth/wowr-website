#!/bin/bash

# Given a txt file name from the map folder.

TXT_FILE="$1"
OUTPUT_FILE="$2"

echo "Reading input TXT file $TXT_FILE to produce an update output TXT file $OUTPUT_FILE"

cat "$TXT_FILE" \
| sed 's/function PreloadFiles takes nothing returns nothing//' \
| sed 's/\tcall PreloadStart()//' \
| sed 's/\tcall Preload( \"//' \
| sed 's/\" )//' \
| sed 's/endfunction//' \
| sed 's/\tcall PreloadEnd( .* )//' \
| sed 's/<!--.*-->//' \
| sed -r '/^\s*$/d' \
| sed '/^$/d' \
| strings \
> "$OUTPUT_FILE"
