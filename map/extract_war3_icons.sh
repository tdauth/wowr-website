#!/bin/bash

WAR3="war3.mpq"
WAR3X="war3x.mpq"
LISTFILE="./Warcraft III.txt"

./extract_mpq_icons.sh "$WAR3" "$LISTFILE"
./extract_mpq_icons.sh "$WAR3X" "$LISTFILE"
