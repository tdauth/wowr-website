#!/bin/bash

MAP_NAME="wowr3.6"
MAP="$MAP_NAME.w3x"
./mpq -x --overwrite -f "(listfile)" "$MAP"
LISTFILE="./$MAP_NAME/(listfile)"

./extract_mpq_icons.sh "$MAP" "$LISTFILE"
