# Cyberdrop Downloader

Cyberdrop Downloader is a script to download all images of a cyberdrop.me album written in shell script.
- It only will work on unix like OS

## Usage

1. Install dependencies:
```shell
$ apt install curl wget -y
```

2. Add exec permisson:
```shell
$ chmod +x ./cyberdrop-downloader.sh
```
3. run:
```shell
$ ./cyberdrop-downloader.sh <cyberdrop-link>
```
To download multiple links create a file with the links (one per line) then run:
```shell
$ ./cyberdrop-downloader.sh -m <filename>
```
