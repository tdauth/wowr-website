#!/bin/bash

#set -x #echo on

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
        extension="${p##*.}"
        echo "$p with extension $extension into $OUTPUT"
        if [ "$extension" = "dds" ]; then
            # DDS is not yet supported by wc3lib.
            convert "$p" "png:$OUTPUT" &
        else
            ./wc3converter --oformat png --outputo "\"$OUTPUT\"" -i "$p" &
        fi
    fi
done

for p in "$FOLDER/ReplaceableTextures/PassiveButtons/"*
do
    OUTPUT="../$(realpath --relative-to="$FOLDER" "$p")"

    if [ ! -f "$OUTPUT" ] ; then
        extension="${p##*.}"
        echo "$p with extension $extension into $OUTPUT"
        if [ "$extension" = "dds" ]; then
            # DDS is not yet supported by wc3lib.
            convert "$p" "png:$OUTPUT" &
        else
            ./wc3converter --oformat png --outputo "\"$OUTPUT\"" -i "$p" &
        fi
    fi
done

wait
