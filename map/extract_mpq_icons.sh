#!/bin/bash

MPQ="$1"
LISTFILE="$2"
echo "MPQ: $MPQ"
echo "(listfile): $LISTFILE"
LISTFILE_OUT="$1.out"
LISTFILE_OUT2="$1.out2"
cat "$LISTFILE" | tr -d '\r' > "$LISTFILE_OUT"
grep "ReplaceableTextures\\\\CommandButtons\\\\" "$LISTFILE_OUT" > "$LISTFILE_OUT2"
grep "ReplaceableTextures\\\\PassiveButtons\\\\" "$LISTFILE_OUT" >> "$LISTFILE_OUT2"
sort "$LISTFILE_OUT2" -o "$LISTFILE_OUT2"

while read -r p
do
    #echo "$p"
    OUTPUT="../${p//\\//}"
    if [ ! -f "$OUTPUT" ] ; then
        echo "$p"
        ./mpq -x --overwrite -f "$p" "$MPQ"
        INPUT="./${MPQ%.*}/${p//\\//}"
        ./wc3converter --oformat png "\"$OUTPUT\"" "$INPUT" &
    fi
done < "$LISTFILE_OUT2"

wait
