# common
    export WORKDOC="$HOME/backups/work"
    export PYTHON=$(which python3)

# nvm config
    export NVM_DIR="$HOME/.nvm"
    nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }
    export PATH=$HOME/.nvm/versions/node/v11.15.0/bin/:$PATH

# set default editor to Vim
    export NVIM=~/.config/nvim

# fzf
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    export FZF_DEFAULT_OPTS="--height 50% --layout=reverse"
    export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,dist} --type f"
    export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -10000'

# add git completion
    autoload -U compinit && compinit
    zmodload -i zsh/complist

# maps
    alias vim='nvim'
    alias vi='nvim'
    alias v='nvim'
    alias vimu='nvim -u NONE -N'
    alias TT='tmux attach'
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
    alias I='cd ~/infoloop'
    alias ns='npm run start'
    alias nb='npm run build'
    alias td='vim +n $WORKDOC/$(date -v-1d +%F).md $WORKDOC/$(date +%F).md'
    alias todo='td'
    alias dx='du -h -d 1'
    S() { ssh root@$1; }
    gll() {
        if [ ! $1 ]; then
            git --no-pager log --pretty=format:"%h %s" --graph -n 10
        else
            git --no-pager log --pretty=format:"%h %s" --graph -n $1
        fi
    }
    glll() {
        if [ ! $1 ]; then
            git --no-pager log --pretty=format:"%H %cd %cn %s" --graph -n 10
        else
            git --no-pager log --pretty=format:"%H %cd %cn %s" --graph -n $1
        fi
    }

if [ -z "$TMUX" ]; then tmux attach -t 0 || tmux new -s 0; fi
clear && echo -e '\033[43;30mhello :) \033[0m'

# oh my zsh config
    export ZSH=~/.config/zsh
    ZSH_THEME="simple"
    plugins=(git z extract)
    source $ZSH/oh-my-zsh.sh
    source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
