#! /bin/bash

init_linux() {
    touch ~/.zshrc
    mkdir -p ~/.config/zsh/cache
    if [ `grep -c "source ~/.config/zsh/init.zshrc" ~/.zshrc` -eq '0' ]; then
        echo "source ~/.config/zsh/init.zshrc" >> ~/.zshrc
        source ~/.zshrc
    fi
}

case $1 in
    "linux")
        init_linux
        ;;
esac

clear && echo -e '\033[43;30minited :) \033[0m'


