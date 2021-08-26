vim() { if [[ $* && -d $* ]] { cd $* && nvim } else { nvim $* } }
alias T='dir=~/backups/todo && mkdir -p $dir && vim $dir/todo.md'
alias vzc='vim $ZSH/init.zshrc'
alias vrc='cd ~/.config/nvim && vim init.vim'
