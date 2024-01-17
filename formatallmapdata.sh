#!/bin/bash


./formatmapdata.sh ./map/WorldOfWarcraftReforged-Heroes.txt ./heroes.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Buildings.txt ./buildings.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Players.txt ./players.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Clans.txt ./clans.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Races.txt ./races.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Units.txt ./units.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Spells.txt ./spells.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Items.txt ./items.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Buildings.txt ./buildings.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Npcs.txt ./npcs.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Quests.txt ./quests.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Researches.txt ./researches.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Resources.txt ./resources.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Bosses.txt ./bosses.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Professions.txt ./professions.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Mounts.txt ./mounts.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-ChatCommands.txt ./chatcommands.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-HeroJourney.txt ./herojourney.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Locations.txt ./locations.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Recipes.txt ./recipes.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-Achievements.txt ./achievements.html
./formatmapdata.sh ./map/WorldOfWarcraftReforged-HeroStandardAbilities.txt ./herostandardabilities.html

for f in ./map/WorldOfWarcraftReforged-Race-*
do
    o=${f##*-}
    o=${o%.txt}
    ./formatmapdata.sh "$f" "./$o.html"
done

# tidy \
#    -indent \
#    --indent-spaces 2 \
#    -quiet \
#    --tidy-mark no \
#    *.html > tidy_output.txt

echo "Done."
