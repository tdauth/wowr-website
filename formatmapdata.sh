#!/bin/bash

# Given a txt file name from the map folder.

FILE="$1"
OUTPUT_FILE="$2"

# Replace the following sections from the txt file:

sed -i 's/function PreloadFiles takes nothing returns nothing//' "$FILE"
sed -i 's/\tcall PreloadStart()//' "$FILE"
sed -i 's/\tcall Preload( \"//' "$FILE"
sed -i 's/endfunction//' "$FILE"
sed -i 's/endfunction//' "$FILE"
sed -i '/^$/d' "$FILE"

# Replace the content between two tbody elements in the given file.

HTML=$(cat $FILE)

echo $HTML
