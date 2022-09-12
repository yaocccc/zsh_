vim() { if [[ $* && -d $* ]] { cd $* && nvim } else { nvim $* } }
