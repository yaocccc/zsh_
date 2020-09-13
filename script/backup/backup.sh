#! /bin/bash

backup() {
    mkdir -p ~/backups/linux
    sudo rsync -Pa / ~/backups/linux --exclude=/media/* --exclude=/sys/* --exclude=/proc/* --exclude=/mnt/* --exclude=/tmp/* --exclude=~/backups/linux/*
}

recovery() {
    sudo rsync -Pa ~/backups/linux/ /
}

case $1 in
    "backup")
        backup
        ;;
    "recovery")
        recovery
        ;;
esac

clear && echo -e '\033[43;30minited :) \033[0m'


