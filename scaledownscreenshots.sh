#!/bin/bash

cd ./screenshots
mkdir ./preview

for f in *.png
do 
    convert -resize 1024X768  "$f" ./preview/"${f%%.*}".jpg
done
