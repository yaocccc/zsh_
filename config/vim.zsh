vim() { if [[ $* && -d $* ]] { cd $* && nvim } else { nvim $* } }
alias T='dir=~/backups/todo && mkdir -p $dir && vim -O $dir/todo.md'
alias vzc='vim $ZSH/init.zshrc'
alias vrc='vim ~/.config/nvim/init.vim'
