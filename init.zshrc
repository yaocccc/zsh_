# common
    export WORKDOC=$HOME/backups/work
    export PYTHON=$(which python3)
    export EDITOR=~/.config/nvim/0.4.3/bin/nvim
    export LAST_PATH_FILE=$HOME/.config/zsh/cache/last_path.env
    export PRIVOXY_ENV_FILE=$HOME/.config/zsh/cache/privoxy.env
    export NVIM=~/.config/nvim

# maps
    alias nvim=~/.config/nvim/0.4.3/bin/nvim
    alias vzc='vim $ZSH/init.zshrc'
    alias vrc='vim $NVIM/init.vim'
    alias vde='vim ~/infoloop/tianting/deploy'
    alias fzf='fzf --preview "bat --style=numbers --color=always {} | head -100" --height 40%'
    alias ts='ts-node'
    alias rl='zsh && exit'
    alias st='source ~/infoloop/test.env'
    alias ns='npm run start'
    alias nt='npm run ts'
    alias nb='npm run build'
    alias td='vim +n $WORKDOC/$(date +"%Y-%m-%d" -d "-24hour").md $WORKDOC/$(date +"%Y-%m-%d").md $WORKDOC/work.md'
    alias dx='du -h -d 1'
    alias sc='~/scripts/set-screen.sh'

    alias qq='nohup /opt/deepinwine/apps/Deepin-TIM/run.sh > /dev/null 2>&1 &'
    alias wechat='nohup /opt/deepinwine/apps/Deepin-WeChat/run.sh > /dev/null 2>&1 &'

    alias gpo='git push origin $(git symbolic-ref --short -q HEAD)'
    alias gpl='git pull origin $(git symbolic-ref --short -q HEAD) --ff-only'
    alias gs='git status'
    alias gss='git status -s'
    gam() { git add --all && git commit -m "$*" }
    gco() { git checkout ${1-"master"} $2 $3 $4 }
    gll() { git --no-pager log --pretty=format:"%h %s" --graph -n ${1-10} }
    glll() { git --no-pager log --pretty=format:"%H %cd %cn %s" --graph -n ${1-10} }
    
    S() { ssh root@$1 }
    vim() { if [[ $* && -d $* ]] { cd $* && nvim } else { nvim $* } }
    tp() {
        if [[ "$http_proxy" == "" ]] {
            ~/scripts/set-privoxy.sh on && source $PRIVOXY_ENV_FILE && echo 'privoxy: on' 
        } else {
            ~/scripts/set-privoxy.sh off && source $PRIVOXY_ENV_FILE && echo 'privoxy: off' 
        }
    }
    cd_hook() {
        emulate -L zsh
        rm $LAST_PATH_FILE
        echo 'export LAST_PATH='$PWD >> $LAST_PATH_FILE
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
    source $ZSH/oh-my-zsh.sh
    source $ZSH/plugins/fzf-tab/fzf-tab.zsh
    source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# fzf
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    export FZF_DEFAULT_OPTS="--height 50% --layout=reverse"
    export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,dist} --type f"
    export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -10000'

# fzf-tab
    FZF_TAB_COMMAND=(fzf --ansi --expect='$continuous_trigger,$print_query' '--color=hl:$(( $#headers == 0 ? 108 : 255 ))' --nth=2,3 --delimiter='\x00' --layout=reverse --height='${FZF_TMUX_HEIGHT:=75%}' --tiebreak=begin -m --bind=tab:down,btab:up,change:top,ctrl-space:toggle --cycle '--query=$query' '--header-lines=$#headers' --print-query --height 40%)
    local extract="local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'} local -A ctxt=(\"\${(@ps:\2:)CTXT}\") local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in realpath=\${(Qe)~realpath}"
    zstyle ':completion:complete:*:options' sort false
    zstyle ':fzf-tab:complete:_zlua:*' query-string input
    zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
    zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
    zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'ls --color=always $realpath'

# enter hook
    source $LAST_PATH_FILE
    source $PRIVOXY_ENV_FILE
    cd $LAST_PATH
    clear
