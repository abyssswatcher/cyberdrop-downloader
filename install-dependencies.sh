#!/bin/bash
# dependencies install script for cyberdrop-downloader

VER='1.2';
COLOR1='\e[94m';
RESET='\e[0m';

echo -e "$COLOR1 + -- --=[ Cyberdrop Downloader v$VER by @hugogomess$RESET";
echo "";

apt-get update;
apt-get install -y curl wget figlet toilet;

exit
