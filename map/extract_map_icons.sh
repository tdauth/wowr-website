#!/bin/bash

MAP_NAME="wowr3.4"
MAP="$MAP_NAME.w3x"
./mpq -x --overwrite -f "(listfile)" "$MAP"
LISTFILE="./$MAP_NAME/(listfile)"
LISTFILE_OUT="./$MAP_NAME/(listfile).out"
LISTFILE_OUT2="./$MAP_NAME/(listfile).out2"
cat "$LISTFILE" | tr -d '\r' > "$LISTFILE_OUT"
grep "ReplaceableTextures\\\\CommandButtons\\\\" "$LISTFILE_OUT" > "$LISTFILE_OUT2"
grep "ReplaceableTextures\\\\PassiveButtons\\\\" "$LISTFILE_OUT" >> "$LISTFILE_OUT2"
sort "$LISTFILE_OUT2" -o "$LISTFILE_OUT2"

while read -r p
do
    #echo "$p"
    echo "$p"
    ./mpq -x --overwrite -f "$p" "$MAP"
done < "$LISTFILE_OUT2"
