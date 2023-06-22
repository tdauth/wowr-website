#!/bin/bash

FOLDER="./wowr.w3x"
echo "Folder: $FOLDER"

if [ ! -d "$FOLDER" ]; then
    echo "Folder does not exist."
    exit 1
fi

for p in "$FOLDER/ReplaceableTextures/CommandButtons/"*
do
    echo "$p"
    OUTPUT="../$(realpath --relative-to="$FOLDER" "$p")"
    ./wc3converter --oformat png "$OUTPUT" "$p"
done
