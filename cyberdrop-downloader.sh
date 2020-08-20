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
    #echo '          _                _                     _                 _              _          ';
    #echo '  __ _  _| |__  ___ _ _ __| |_ _ ___ _ __ ___ __| |_____ __ ___ _ | |___  __ _ __| |___ _ _  ';
    #echo ' / _| || | '_ \/ -_) '_/ _` | '_/ _ \ '_ \___/ _` / _ \ V  V / ' \| / _ \/ _` / _` / -_) '_| ';
    #echo ' \__|\_, |_.__/\___|_| \__,_|_| \___/ .__/   \__,_\___/\_/\_/|_||_|_\___/\__,_\__,_\___|_|   ';
    #echo '     |__/                           |_|                                                      ';
    #echo '';
    echo -e "$COLOR1 + -- --=[ Cyberdrop Downloader v$VER by @hugogomess$RESET";
    echo -e "$COLOR1 + -- --=[ Usage: ./cyberdrop-downloader.sh <cyberdrop-link>$RESET";
    echo -e "$COLOR1 + -- --=[ Multiple Files: ./cyberdrop-downloader.sh -m$RESET";
elif [ "$1" == "-m" ]; then
    echo -e "$COLOR1 + -- --=[ Cyberdrop Downloader v$VER by @hugogomess$RESET";
    echo -e "$COLOR1 + -- --=[ Usage: ./cyberdrop-downloader.sh <cyberdrop-link>$RESET";
    echo '';

    filename='download-list'
    while read line; do
        ALBUM_NAME=$(curl "$line" | grep 'title has-text-centered' | cut -d '"' -f6 | head -n1);
        mkdir "$ALBUM_NAME" && cd "$ALBUM_NAME";

        curl "$line" | grep 'id="file"' | cut -d '"' -f6 > LINKS;
        wget -i LINKS -q --show-progress;
        rm LINKS;
        cd "..";
    done < $filename;
else
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