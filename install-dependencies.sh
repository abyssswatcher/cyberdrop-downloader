#!/bin/bash
# dependencies install script for cyberdrop-downloader

VER='1.0';

echo '+ -- --=[ Cyberdrop Downloader v'$VER 'by @hugogomess';

apt-get update;
apt-get install -y curl wget;

exit
