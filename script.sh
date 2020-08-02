#!/bin/bash
# Usage: ./script.sh https://cyberdrop.me/a/nJmf3qds

album_name=$(curl $1 | grep 'title has-text-centered' | cut -d '"' -f6 | head -n1);
mkdir "$album_name";
cd "$album_name";

curl $1 | grep 'id="file"' | cut -d '"' -f6 > links;

cat links | while read -r link; do
    wget "$link";
done;

exit
