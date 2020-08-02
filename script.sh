#!/bin/bash
#
# Cyberdrop Downloader by @hugogomess
# https://hugogomess.github.io/
#
# ABOUT:
# Cyberdrop Downloader is a script to download all images of a cyberdrop.me album written in shell script
#
# INSTALL:
# ./install.sh
#
# USAGE:
# ./cyberdrop-downloader.sh <cyberdrop-link>

VER='1.0';

if [ "$1" == "" ] || [ "$1" == "-h" ]; then
    #echo '          _                _                     _                 _              _          ';
    #echo '  __ _  _| |__  ___ _ _ __| |_ _ ___ _ __ ___ __| |_____ __ ___ _ | |___  __ _ __| |___ _ _  ';
    #echo ' / _| || | '_ \/ -_) '_/ _` | '_/ _ \ '_ \___/ _` / _ \ V  V / ' \| / _ \/ _` / _` / -_) '_| ';
    #echo ' \__|\_, |_.__/\___|_| \__,_|_| \___/ .__/   \__,_\___/\_/\_/|_||_|_\___/\__,_\__,_\___|_|   ';
    #echo '     |__/                           |_|                                                      ';
    #echo '';
    echo '+ -- --=[ Cyberdrop Downloader v'$VER 'by @hugogomess';
    echo '+ -- --=[ Usage: ./cyberdrop-downloader.sh <cyberdrop-link>';
else
    echo '+ -- --=[ Cyberdrop Downloader v'$VER 'by @hugogomess';
    echo '+ -- --=[ Usage: ./cyberdrop-downloader.sh <cyberdrop-link>';
    echo '';

    album_name=$(curl $1 | grep 'title has-text-centered' | cut -d '"' -f6 | head -n1);
    mkdir "$album_name";
    cd "$album_name";

    curl $1 | grep 'id="file"' | cut -d '"' -f6 > links;

    cat links | while read -r link; do
        wget "$link";
    done;
fi
exit


