# Cyberdrop Downloader

Cyberdrop Downloader is a script to download all images of a cyberdrop.me album written in shell script
- It only will work on unix like OS

## Install

If you dont have curl and wget installed:
```
$ chmod +x install-dependencies.sh && sudo ./install-dependencies.sh
```

## How to use

First add exec permisson:
```
$ chmod +x ./cyberdrop-downloader.sh
```
And run:
```
$ ./cyberdrop-downloader.sh
```
To download multiple links create a file with the links (one per line) then run:
```
$ ./cyberdrop-downloader.sh -m <filename>
```

### TODO

- Fix print figlet;
