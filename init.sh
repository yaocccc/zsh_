#! /bin/bash

init_linux() {
    touch ~/.zshrc
    if [ `grep -c "source ~/.config/zsh/.local.zshrc" ~/.zshrc` -eq '0' ]; then
        rm ~/.config/zsh/.local.zshrc
        echo "export EDITOR=~/.config/nvim/0.4.3/linux/bin/nvim" >> ~/.config/zsh/.local.zshrc
        echo "alias nvim=~/.config/nvim/0.4.3/linux/bin/nvim" >> ~/.config/zsh/.local.zshrc
        echo "source ~/.config/zsh/init.zshrc" >> ~/.config/zsh/.local.zshrc
        echo "source ~/.config/zsh/.local.zshrc" >> ~/.zshrc
        source ~/.zshrc
    fi
}

init_mac() {
    touch ~/.zshrc
    if [ `grep -c "source ~/.config/zsh/.local.zshrc" ~/.zshrc` -eq '0' ]; then
        rm ~/.config/zsh/.local.zshrc
        echo "alias vs='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'" >> ~/.config/zsh/.local.zshrc
        echo "export EDITOR=~/.config/nvim/0.4.3/mac/bin/nvim" >> ~/.config/zsh/.local.zshrc
        echo "alias nvim=~/.config/nvim/0.4.3/mac/bin/nvim" >> ~/.config/zsh/.local.zshrc
        echo "source ~/.config/zsh/init.zshrc" >> ~/.config/zsh/.local.zshrc
        echo "source ~/.config/zsh/.local.zshrc" >> ~/.zshrc
        source ~/.zshrc
    fi
}

case $1 in
    "linux")
        init_linux
        ;;
    "mac")
        init_mac
        ;;
esac

clear && echo -e '\033[43;30mhello :) \033[0m'


