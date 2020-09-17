#! /bin/bash

backup() {
    mkdir -p ~/backups/linux
    sudo rsync -Pa / ~/backups/linux --exclude=/media/* --exclude=/sys/* --exclude=/proc/* --exclude=/mnt/* --exclude=/tmp/* --exclude=/home/chenyc/backups/linux/*
    clear && echo -e '\033[43;30mbackup completed :) \033[0m'
}

recovery() {
    sudo rsync -Pa ~/backups/linux/ /
    clear && echo -e '\033[43;30mrecovery completed:) \033[0m'
}

case $1 in
    "backup")
        backup
        ;;
    "recovery")
        recovery
        ;;
esac
