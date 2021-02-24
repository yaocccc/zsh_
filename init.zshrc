# profile
    export ZSH=~/.config/zsh
    export PYTHON=$(which python)
    export WORKDOC=/home/chenyc/backups/work
    export EDITOR=nvim

# maps
    vim() { if [[ $* && -d $* ]] { cd $* && nvim } else { nvim $* } }
    rm() {
        for f in $*;
        do
            [ -f $f ] && mv $f ~/.local/share/Trash/files/$(date '+%Y%m%d-%H%M')$f;
            [ -d $f ] && mv $f ~/.local/share/Trash/files/$(date '+%Y%m%d-%H%M')$f;
        done
    }
    alias year='dir=~/backups/todo/$(date +"%Y") && mkdir -p $dir && cd $dir && vim $(date +"%Y").md'
    alias month='dir=~/backups/todo/$(date +"%Y")/$(date +"%Y.%m") && mkdir -p $dir && cd $dir && vim $(date +"%Y.%m").md'
    alias day='dir=~/backups/todo/$(date +"%Y")/$(date +"%Y.%m") && mkdir -p $dir && cd $dir && vim $(date +"%Y.%m.%d").md'
    alias S='startx'
    alias vzc='vim $ZSH/init.zshrc'
    alias vrc='vim ~/.config/nvim/init.vim'
    alias fzf='fzf --preview "bat -p --color=always {} | head -100" --height 40%'
    alias ts='ts-node'
    alias ns='npm run start'
    alias nb='npm run build'
    alias td='vim +2n $WORKDOC/todo.md $WORKDOC/$(date +"%Y-%m-%d" -d "-24hour").md $WORKDOC/$(date +"%Y-%m-%d").md $WORKDOC/work.md'
    alias dx='du -h -d 1'
    alias getip="ip addr show | grep '192.168.' | awk '{print \$2}'"
    alias git='git --no-pager'
    alias sc='~/scripts/set-screen.sh'
    alias bl='~/scripts/bluetooth.sh'
    alias gif='~/scripts/gif-recorder.sh'
    alias vpn='~/scripts/app-starter.sh vpn '
    alias google='web_search google'
    alias baidu='web_search baidu'
    alias gco='git checkout'
    alias gpo='git push origin $(git symbolic-ref --short -q HEAD)'
    alias gpl='git pull origin $(git symbolic-ref --short -q HEAD) --ff-only'
    alias gs='git status'
    alias gss='git status -s'
    alias tp='~/scripts/app-starter.sh toogle_privoxy && source ~/.profile'
    alias ssh='~/.ssh/ssh.sh'
    gam() { git add --all && git commit -m "$*" }
    gll() { git --no-pager log --pretty=format:"%h %cn: %s" --graph -n ${1-10} }
    glll() { git --no-pager log --pretty=format:"%H %cd %cn: %s" --graph -n ${1-10} }
    docker() {
        case $* in
            restart) sudo docker restart $(sudo docker ps -a | sed 1d | awk '{print $1}') ;;
            stop) sudo docker stop $(sudo docker ps -a | sed 1d | awk '{print $1}') ;;
            ps) sudo docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}" ;;
            *) sudo docker $* ;;
        esac
    }

# nvm config
    export NVM_DIR="$HOME/.nvm"
    nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }
    export PATH=$HOME/.nvm/versions/node/v12.20.1/bin/:$PATH

# oh my zsh config
    ZSH_THEME="simple"
    DISABLE_AUTO_TITLE="true"
    plugins=(z extract fzf-tab web-search)
    alias ex="extract"
    autoload -Uz add-zsh-hook
    autoload -U compinit && compinit
    zmodload -i zsh/complist
    unsetopt correct
    bindkey -e
    bindkey '^H' backward-kill-word
    source $ZSH/oh-my-zsh.sh
    source $ZSH/plugins/fzf-tab/fzf-tab.zsh
    source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
    preexec_hook() { _cmd=($(echo $2)); print -n "\e]2;${(q)_cmd[1]} - $(basename `pwd`)\a"; }
    chpwd_hook() { ~/scripts/edit-profile.sh CURRENT_DIR $PWD; }
    add-zsh-hook -Uz preexec preexec_hook
    add-zsh-hook -Uz chpwd chpwd_hook

# fzf
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    export FZF_DEFAULT_OPTS="--height 50% --layout=reverse"
    export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,dist} --type f"
    export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat -n --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -10000'

# fzf-tab
    FZF_TAB_COMMAND=(fzf --ansi --expect='$continuous_trigger,$print_query' '--color=hl:$(( $#headers == 0 ? 108 : 255 ))' --nth=2,3 --delimiter='\x00' --layout=reverse --height='${FZF_TMUX_HEIGHT:=75%}' --tiebreak=begin -m --bind=tab:down,btab:up,change:top,ctrl-space:toggle --cycle '--query=$query' '--header-lines=$#headers' --print-query --height 40%)
    local extract="
    in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
    local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
    "

    zstyle ':completion:complete:*:options' sort false
    zstyle ':fzf-tab:complete:_zlua:*' query-string input
    zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
    zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
    zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'ls --color=always ${~ctxt[hpre]}$in'
    zstyle ':fzf-tab:complete:vim:*' extra-opts --preview=$extract'[ -f ${~ctxt[hpre]}$in ] && bat -p --color=always ${~ctxt[hpre]}$in | head -100 || ls --color=always ${~ctxt[hpre]}$in'

# enter hook
    source ~/.profile
    xset -b
    if [[ -d $VIM_TEM_DIR ]] { cd $VIM_TEM_DIR && ~/scripts/edit-profile.sh VIM_TEM_DIR '' } else { cd $CURRENT_DIR }
    print -n "\e]2;$(basename `pwd`)\a"
    clear
