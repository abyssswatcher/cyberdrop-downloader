#!/bin/bash
#
# Cyberdrop Downloader by @hugogomess
# https://hugogomess.github.io/
#
# ABOUT:
# Cyberdrop Downloader is a script to download all images of a cyberdrop.me album written in shell script
#
# INSTALL:
# sudo ./install-dependencies.sh
#
# USAGE:
# ./cyberdrop-downloader.sh <cyberdrop-link>

VER='1.2';
COLOR1='\e[94m';
RESET='\e[0m';

if [ "$1" == "" ] || [ "$1" == "-h" ]; then
    echo '';
    figlet -t -c cyberdrop downloader
    echo '';
    echo -e "$COLOR1 + -- --=[ Cyberdrop Downloader v$VER by @hugogomess$RESET";
    echo -e "$COLOR1 + -- --=[ Usage: ./cyberdrop-downloader.sh <cyberdrop-link>$RESET";
    echo -e "$COLOR1 + -- --=[ Multiple Files: ./cyberdrop-downloader.sh -m$RESET";
elif [ "$1" == "-m" ]; then
    echo '';
    figlet -t -c cyberdrop downloader
    echo '';
    echo -e "$COLOR1 + -- --=[ Cyberdrop Downloader v$VER by @hugogomess$RESET";
    echo -e "$COLOR1 + -- --=[ Usage: ./cyberdrop-downloader.sh <cyberdrop-link>$RESET";
    echo '';

    filename=$2
    while read line; do
        ALBUM_NAME=$(curl "$line" | grep 'title has-text-centered' | cut -d '"' -f6 | head -n1);
        mkdir "$ALBUM_NAME" && cd "$ALBUM_NAME";

        curl "$line" | grep 'id="file"' | cut -d '"' -f6 > LINKS;
        wget -i LINKS -q --show-progress;
        rm LINKS;
        cd "..";
    done < $filename;
else
    echo '';
    figlet -t -c cyberdrop downloader
    echo '';
    echo -e "$COLOR1 + -- --=[ Cyberdrop Downloader v$VER by @hugogomess$RESET";
    echo -e "$COLOR1 + -- --=[ Usage: ./cyberdrop-downloader.sh <cyberdrop-link>$RESET";
    echo '';

    ALBUM_NAME=$(curl "$1" | grep 'title has-text-centered' | cut -d '"' -f6 | head -n1);
    mkdir "$ALBUM_NAME" && cd "$ALBUM_NAME";

    curl "$1" | grep 'id="file"' | cut -d '"' -f6 > LINKS;
    wget -i LINKS -q --show-progress;
    rm LINKS;
fi
exit
