# maps
    vim() { if [[ $* && -d $* ]] { cd $* && nvim } else { nvim $* } }
    alias S='startx'
    alias vzc='vim $ZSH/init.zshrc'
    alias vrc='vim ~/.config/nvim/init.vim'
    alias vde='vim ~/infoloop/tianting/deploy'
    alias fzf='fzf --preview "bat -p --color=always {} | head -100" --height 40%'
    alias ts='ts-node'
    alias rl='zsh && exit'
    alias st='source ~/infoloop/test.env'
    alias ns='npm run start'
    alias nt='npm run ts'
    alias nb='npm run build'
    alias td='vim +2n $WORKDOC/todo.md $WORKDOC/$(date +"%Y-%m-%d" -d "-24hour").md $WORKDOC/$(date +"%Y-%m-%d").md $WORKDOC/work.md'
    alias dx='du -h -d 1'
    alias npm='npm $* --registry=http://registry.npm.taobao.org'
    alias getip="ip addr show | grep '192.168.1' | awk '{print \$2}'"
    alias git='git --no-pager'
    alias sc='~/scripts/set-screen.sh'
    alias bl='~/scripts/bluetooth.sh'
    alias ssh='~/scripts/ssh.sh'
    alias gif='~/scripts/gif-recorder.sh'
    alias qq='nohup /opt/deepinwine/apps/Deepin-TIM/run.sh > /dev/null 2>&1 &'
    alias google='web_search google'
    alias baidu='web_search baidu'
    alias gco='git checkout'
    alias gpo='git push origin $(git symbolic-ref --short -q HEAD)'
    alias gpl='git pull origin $(git symbolic-ref --short -q HEAD) --ff-only'
    alias gs='git status'
    alias gss='git status -s'
    gam() { git add --all && git commit -m "$*" }
    gll() { git --no-pager log --pretty=format:"%h %cn: %s" --graph -n ${1-10} }
    glll() { git --no-pager log --pretty=format:"%H %cd %cn: %s" --graph -n ${1-10} }
    tp() {
        if [[ "$http_proxy" == "" ]] {
            ~/scripts/set-privoxy.sh on >> /dev/null 2>&1 && source ~/.profile
            echo 'privoxy: on'
        } else {
            ~/scripts/set-privoxy.sh off >> /dev/null 2>&1 && source ~/.profile
            echo 'privoxy: off'
        }
    }
    docker() {
        case $* in
            restart) sudo docker restart $(sudo docker ps -a | sed 1d | awk '{print $1}') ;;
            stop) sudo docker stop $(sudo docker ps -a | sed 1d | awk '{print $1}') ;;
            ps) sudo docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}" ;;
            *) sudo docker $* ;;
        esac
    }
    cd_hook() {
        emulate -L zsh
        ~/scripts/edit-profile.sh CURRENT_DIR $PWD
    }
    chpwd_functions=(${chpwd_functions[@]} "cd_hook")

# nvm config
    export NVM_DIR="$HOME/.nvm"
    nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }
    export PATH=$HOME/.nvm/versions/node/v11.15.0/bin/:$PATH

# oh my zsh config
    export ZSH=~/.config/zsh
    ZSH_THEME="simple"
    plugins=(z extract fzf-tab web-search)
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
    clear
