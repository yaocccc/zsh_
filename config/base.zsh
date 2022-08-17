export PYTHON=$(which python3)
export EDITOR=nvim
export TRASH=~/.local/share/Trash/files

alias S='startx'
alias dx='sudo du -h -d 1'
alias sc='~/scripts/set-screen.sh'
alias scc='~/scripts/set-wallpaper.sh'
alias bl='~/scripts/bluetooth.sh'
alias gif='~/scripts/gif-recorder.sh'
alias vpn='~/scripts/app-starter.sh vpn '
alias vpn2='~/scripts/app-starter.sh vpn2 '
alias surf='~/scripts/app-starter.sh surf'
alias ssh='~/.ssh/ssh.sh'
alias scp='~/.ssh/scp.sh'
alias up='st -e nvim +PackerSync\|CocUpdate >> /dev/null 2>&1 & sudo pacman -Syyu'

tp() {
    [ "$(docker ps | grep v2raya)" ] && docker stop v2raya || docker restart v2raya
    ~/scripts/dwm-status.sh
}
col() {
    awk '{print $'$1'}'
}
rm() {
    for f in $*;
    do
        dir=$TRASH/$(date '+%Y%m%d-%H%M')
        target=$dir/${f##*/}
        mkdir -p $dir
        [ -f $f ] && mv $f $target;
        [ -d $f ] && mv $f $target;
    done
}
docker() {
    case $* in
        restart) sudo docker restart $(sudo docker ps -a | sed 1d | col 1) ;;
        stop) sudo docker stop $(sudo docker ps -a | sed 1d | col 1) ;;
        rm) sudo docker rm $(sudo docker ps -a | sed 1d | col 1) ;;
        rmi) sudo docker rmi $(sudo docker images | sed 1d | col 3) ;;
        ps) sudo docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}" ;;
        *) sudo docker $* ;;
    esac
}
bili() {
    curl -X POST 'localhost:9527' -d "$*"
}
