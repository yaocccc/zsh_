vim() { if [[ $* && -d $* ]] { cd $* && nvim } else { nvim $* } }
alias T='dir=~/backups/todo; _dir=$PWD && mkdir -p $dir && cd $dir && vim todo.md t.md && cd $_dir'
alias vzc='_dir=$PWD && cd $ZSH && vim $ZSH/init.zshrc && cd $_dir'
alias vrc='_dir=$PWD && cd ~/.config/nvim && vim init.lua && cd $_dir'
