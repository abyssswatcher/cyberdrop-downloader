#!/bin/bash
# dependencies install script for cyberdrop-downloader

VER='1.0';
COLOR1='\033[91m';
RESET='\e[0m';

echo -e "$COLOR1 + -- --=[ Cyberdrop Downloader v$VER by @hugogomess$RESET";
echo "";

apt-get update;
apt-get install -y curl wget;

exit
