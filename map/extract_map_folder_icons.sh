#!/bin/bash

FOLDER="./wowr.w3x"
echo "Folder: $FOLDER"

if [ ! -d "$FOLDER" ]; then
    echo "Folder does not exist."
    exit 1
fi

for p in "$FOLDER/ReplaceableTextures/CommandButtons/"*
do
    OUTPUT="../$(realpath --relative-to="$FOLDER" "$p")"

    if [ ! -f "$OUTPUT" ] ; then
        echo "$p"
        ./wc3converter --oformat png "$OUTPUT" "$p"
    fi
done
