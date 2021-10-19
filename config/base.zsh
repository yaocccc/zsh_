export PYTHON=$(which python)
export EDITOR=nvim

alias S='startx'
alias dx='sudo du -h -d 1'
alias getip="ip addr show | grep '192.168.' | awk '{print \$2}'"
alias sc='~/scripts/set-screen.sh'
alias scc='~/scripts/set-wallpaper.sh'
alias bl='~/scripts/bluetooth.sh'
alias gif='~/scripts/gif-recorder.sh'
alias vpn='~/scripts/app-starter.sh vpn '
alias vpn2='~/scripts/app-starter.sh vpn2 '
alias google='web_search google'
alias baidu='web_search baidu'
alias C='~/scripts/app-starter.sh clock && exit'
alias surf='~/scripts/app-starter.sh surf'
alias ast='~/scripts/app-starter.sh ast'
alias ssh='~/.ssh/ssh.sh'
alias rl='sudo systemctl restart NetworkManager.service'
alias up='st -e nvim +PlugUpdate\|CocUpdate >> /dev/null 2>&1 & sudo pacman -Syyu'
alias weather="curl -sf 'wttr.in/ShangHai'"
alias weather2="curl -sf 'wttr.in/WenZhou'"

tp() {
    [ "$(docker ps | grep v2raya)" ] && docker stop v2raya || docker restart v2raya
    ~/scripts/dwm-status.sh
}
c() {
    awk '{print $'$1'}'
}
rm() {
    for f in $*;
    do
        dir=~/.local/share/Trash/files/$(date '+%Y%m%d-%H%M')
        target=$dir/${f##*/}
        mkdir -p $dir
        [ -f $f ] && mv $f $target;
        [ -d $f ] && mv $f $target;
    done
}
docker() {
    case $* in
        restart) sudo docker restart $(sudo docker ps -a | sed 1d | c 1) ;;
        stop) sudo docker stop $(sudo docker ps -a | sed 1d | c 1) ;;
        rm) sudo docker rm $(sudo docker ps -a | sed 1d | c 1) ;;
        rmi) sudo docker rmi $(sudo docker images | sed 1d | c 3) ;;
        ps) sudo docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}" ;;
        *) sudo docker $* ;;
    esac
}
