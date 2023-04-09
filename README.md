# World of Warcraft Reforged Official Website

Official website of [World of Warcraft Reforged](https://github.com/tdauth/wowr): [wowreforged.org](https://wowreforged.org)

Inspired by Websites like [MojoStormStout's Warcraft III Strategy Guide](http://classic.battle.net/war3/).

Located [here](https://tdauth.cdauth.eu/).


The website will pull the changes from this repository automatically every 15 minutes.


## Updating Map Data (Windows)

* Play the map and enter the cheat "-website".
* Adapt the script [updatemapdata.bat](./updatemapdata.bat) with matching file paths and run it.
* Copy&paste the data from the files in [map](./map) into the corresponding HTML files between the tbody tags and replace all JASS code. TODO This step needs some script.
* Add, commit and push all files with git.

## Updating Icons (Linux)

* Download a version of the map into the [map](./map) folder and enter the path in [extract_map_icons.sh](./extract_map_icons.sh) and run the script.
* Add, commit and push all files with git.
* Optional: If you need the latest icons from Warcraft MPQ archives, place the Warcraft III MPQ archives into the [map](./map) folder and do the same stuff but with the script [extract_war3_icons.sh](./extract_war3_icons.sh).
* TODO: CASC archives are not supported yet.

