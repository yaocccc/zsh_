# common
    export WORKDOC="$HOME/backups/work"
    export PYTHON=$(which python3)

# nvm config
    export NVM_DIR="$HOME/.nvm"
    nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }
    export PATH=$HOME/.nvm/versions/node/v11.15.0/bin/:$PATH

# set default editor to Vim
    export NVIM=~/.config/nvim

# maps
    alias vimu='nvim -u NONE -N'
    alias gpo='git push origin'
    alias gc='git clone'
    alias gcc='git checkout'
    alias gs='git status'
    alias vzc='vim $ZSH/init.zshrc'
    alias vrc='vim $NVIM/init.vim'
    alias fzf='fzf --preview "bat --style=numbers --color=always {} | head -100" --height 40%'
    alias gam='git add --all && git commit -m'
    alias gmm='git commit -m'
    alias ts='ts-node'
    alias rl='zsh && exit'
    alias st='source ~/infoloop/test.env'
    alias ns='npm run start'
    alias nb='npm run build'
    alias td='vim +n $WORKDOC/$(date +"%Y-%m-%d" -d "-24hour").md $WORKDOC/$(date +"%Y-%m-%d").md'
    alias dx='du -h -d 1'
    S() { ssh root@$1 }
    gll() { git --no-pager log --pretty=format:"%h %s" --graph -n ${1-10} }
    glll() { git --no-pager log --pretty=format:"%H %cd %cn %s" --graph -n ${1-10} }
    vim() { if [[ $* && -d $* ]] { cd $* && nvim } else { nvim $* } }
    sc() { ~/.config/zsh/xrandconfig/$1.sh }

# oh my zsh config
    export ZSH=~/.config/zsh
    ZSH_THEME="simple"
    plugins=(git z extract fzf-tab)

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
    FZF_TAB_COMMAND=(
        fzf
        --ansi
        --expect='$continuous_trigger,$print_query'
        '--color=hl:$(( $#headers == 0 ? 108 : 255 ))'
        --nth=2,3 --delimiter='\x00'
        --layout=reverse --height='${FZF_TMUX_HEIGHT:=75%}'
        --tiebreak=begin -m --bind=tab:down,btab:up,change:top,ctrl-space:toggle --cycle
        '--query=$query'
        '--header-lines=$#headers'
        --print-query
        --height 40%
    )
    local extract="
    local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
    local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
    local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
    realpath=\${(Qe)~realpath}
    "
    zstyle ':completion:complete:*:options' sort false
    zstyle ':fzf-tab:complete:_zlua:*' query-string input
    zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
    zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
    zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'ls --color=always $realpath'

clear
