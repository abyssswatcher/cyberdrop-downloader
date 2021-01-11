#!/bin/bash
#
# Cyberdrop Downloader by @0xkaneki
# https://0xkaneki.com/
#
# ABOUT:
# Cyberdrop Downloader is a script to download all images of a cyberdrop.me album written in shell script
#
# INSTALL:
# apt install curl wget -y
#
# USAGE:
# ./cyberdrop-downloader.sh <cyberdrop-link>
# Multiple Albums: ./cyberdrop-downloader.sh -m <filename>

VER='1.3';
COLOR1='\e[94m';
RESET='\e[0m';

if [ "$1" == "" ] || [ "$1" == "-h" ]; then
    echo -e "$COLOR1          _                _                     _                 _              _ ";   
    echo -e "$COLOR1  __ _  _| |__  ___ _ _ __| |_ _ ___ _ __ ___ __| |_____ __ ___ _ | |___  __ _ __| |___ _ _  ";
    echo -e "$COLOR1 / _| || |  _ \/ -_)  _/ _  |  _/ _ \  _ \___/ _  / _ \ V  V /   \| / _ \/ _  / _  / -_)  _| ";
    echo -e "$COLOR1 \__|\_, |_.__/\___|_| \__,_|_| \___/ .__/   \__,_\___/\_/\_/|_||_|_\___/\__,_\__,_\___|_|  ";
    echo -e "$COLOR1     |__/                           |_|     ";
    echo -e "";
    echo -e "";
    echo -e "$COLOR1 + -- --=[ Cyberdrop Downloader v$VER by @0xkaneki$RESET";
    echo -e "$COLOR1 + -- --=[ Usage: ./cyberdrop-downloader.sh <cyberdrop-link>$RESET";
    echo -e "$COLOR1 + -- --=[ Multiple Albums: ./cyberdrop-downloader.sh -m <filename>$RESET";
elif [ "$1" == "-m" ]; then
    echo -e "$COLOR1          _                _                     _                 _              _ ";   
    echo -e "$COLOR1  __ _  _| |__  ___ _ _ __| |_ _ ___ _ __ ___ __| |_____ __ ___ _ | |___  __ _ __| |___ _ _  ";
    echo -e "$COLOR1 / _| || |  _ \/ -_)  _/ _  |  _/ _ \  _ \___/ _  / _ \ V  V /   \| / _ \/ _  / _  / -_)  _| ";
    echo -e "$COLOR1 \__|\_, |_.__/\___|_| \__,_|_| \___/ .__/   \__,_\___/\_/\_/|_||_|_\___/\__,_\__,_\___|_|  ";
    echo -e "$COLOR1     |__/                           |_|     ";
    echo -e "";
    echo -e "";
    echo -e "$COLOR1 + -- --=[ Cyberdrop Downloader v$VER by @0xkaneki$RESET";
    echo -e "";

    FILENAME=$2
    while read LINE; do
        ALBUM_NAME=$(curl "$LINE" | grep 'title has-text-centered' | cut -d '"' -f6 | head -n1);
        ALBUM_ID=$(basename "$LINE" | cut -d? -f1);
        mkdir "$ALBUM_NAME ($ALBUM_ID)" && cd "$ALBUM_NAME ($ALBUM_ID)";

        curl "$LINE" | grep 'id="file"' | cut -d '"' -f6 > LINKS;
        wget -i LINKS -q --show-progress;
        rm LINKS;
        cd "..";
    done < $FILENAME;
else
    echo -e "$COLOR1          _                _                     _                 _              _ ";   
    echo -e "$COLOR1  __ _  _| |__  ___ _ _ __| |_ _ ___ _ __ ___ __| |_____ __ ___ _ | |___  __ _ __| |___ _ _  ";
    echo -e "$COLOR1 / _| || |  _ \/ -_)  _/ _  |  _/ _ \  _ \___/ _  / _ \ V  V /   \| / _ \/ _  / _  / -_)  _| ";
    echo -e "$COLOR1 \__|\_, |_.__/\___|_| \__,_|_| \___/ .__/   \__,_\___/\_/\_/|_||_|_\___/\__,_\__,_\___|_|  ";
    echo -e "$COLOR1     |__/                           |_|     ";
    echo -e "";
    echo -e "";
    echo -e "$COLOR1 + -- --=[ Cyberdrop Downloader v$VER by @0xkaneki$RESET";
    echo -e "";

    ALBUM_NAME=$(curl "$1" | grep 'title has-text-centered' | cut -d '"' -f6 | head -n1);
    ALBUM_ID=$(basename "$1" | cut -d? -f1);
    mkdir "$ALBUM_NAME ($ALBUM_ID)" && cd "$ALBUM_NAME ($ALBUM_ID)";

    curl "$1" | grep 'id="file"' | cut -d '"' -f6 > LINKS;
    wget -i LINKS -q --show-progress;
    rm LINKS;
    cd "..";
fi

exit
