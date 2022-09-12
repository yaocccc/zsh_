export ZSH=~/.config/zsh
source $ZSH/config/private.zsh
source $ZSH/config/base.zsh
source $ZSH/config/git.zsh
source $ZSH/config/node.zsh
source $ZSH/config/vim.zsh
source $ZSH/config/zsh.zsh
source $ZSH/config/fzf.zsh

# 如果当前在tty1自动开启startx
[ $(tty) = "/dev/tty1" ] && cd ~ && startx
