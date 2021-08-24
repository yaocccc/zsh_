export PYTHON=$(which python)
export EDITOR=nvim

alias S='startx'
alias l='ls --time-style=long-iso -l'
alias dx='sudo du -h -d 1'
alias getip="ip addr show | grep '192.168.' | awk '{print \$2}'"
alias sc='~/scripts/set-screen.sh'
alias scc='~/scripts/set-mp4-wallpaper.sh'
alias bl='~/scripts/bluetooth.sh'
alias gif='~/scripts/gif-recorder.sh'
alias vpn='~/scripts/app-starter.sh vpn '
alias vpn2='~/scripts/app-starter.sh vpn2 '
alias google='web_search google'
alias baidu='web_search baidu'
alias clock='~/scripts/app-starter.sh clock && exit'
alias surf='~/scripts/app-starter.sh surf'
alias tp='~/scripts/app-starter.sh toogle_privoxy && source ~/.profile'
alias ast='~/scripts/app-starter.sh ast'
alias ssh='~/.ssh/ssh.sh'
alias rl='sudo systemctl restart NetworkManager.service'
alias up='st -e nvim +PlugUpdate\|CocUpdate >> /dev/null 2>&1 & sudo pacman -Syyu'
rm() {
    for f in $*;
    do
        dir=~/.local/share/Trash/files/$(date '+%Y%m%d')/${f%/*}
        mkdir -p $dir
        [ -f $f ] && mv $f $dir/${f##*/};
        [ -d $f ] && mv $f $dir/${f##*/};
    done
}
docker() {
    case $* in
        restart) sudo docker restart $(sudo docker ps -a | sed 1d | awk '{print $1}') ;;
        stop) sudo docker stop $(sudo docker ps -a | sed 1d | awk '{print $1}') ;;
        ps) sudo docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}" ;;
        *) sudo docker $* ;;
    esac
}
