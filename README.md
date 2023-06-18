# World of Warcraft Reforged Official Website

Official website of [World of Warcraft Reforged](https://github.com/tdauth/wowr): [wowreforged.org](https://wowreforged.org)

Inspired by Websites like [MojoStormStout's Warcraft III Strategy Guide](http://classic.battle.net/war3/).

Located [here](https://tdauth.cdauth.eu/wowr-website).


The website will pull the changes from this repository automatically every 15 minutes.


## Updating Map Data (Windows)

* Play the map and enter the cheat "-website".
* Run the script [updatemapdata.bat](./map/updatemapdata.bat) with matching file paths to update the text files with all generated HTML data for the website.
* Run the script [formatallmapdata.html](./formatallmapdata.html) to update all HTML tables of the website.
* Add, commit and push all files with git.

## Updating Icons (Linux)

* Enter the file path in and run the script [download.sh](./map/download.sh) in the [map](./map) folder to download the latest version of the map into the map folder.
* Enter the file path of the map file in [extract_map_icons.sh](./map/extract_map_icons.sh) and run the script.
* Add, commit and push all files with git.
* Optional: If you need the latest icons from Warcraft MPQ archives, place the Warcraft III MPQ archives into the [map](./map) folder and do the same stuff but with the script [extract_war3_icons.sh](./map/extract_war3_icons.sh).
* TODO: CASC archives are not supported yet.

## Updating Preview Thumbnails of Screenshots (Linux)

* Run the script [scaledownscreenshots.sh](./scaledownscreenshots.sh)  which generates the preview thumbails into the directory [preview](./screenshots/preview).
* Use the file paths as image file paths for the thumnails in [index.html](index.html).
