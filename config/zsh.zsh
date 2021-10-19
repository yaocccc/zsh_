source $ZSH/omz.sh
source $ZSH/themes/simple.zsh-theme

source $ZSH/plugins/z/z.plugin.zsh
source $ZSH/plugins/extract/extract.plugin.zsh
source $ZSH/plugins/fzf-tab/fzf-tab.zsh
source $ZSH/plugins/fzf-tab/fzf-tab.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

preexec_hook() { _cmd=($(echo $2)); print -n "\e]2;${(q)_cmd[1]} - $(basename `pwd`)\a"; }
chpwd_hook() { ~/scripts/edit-profile.sh CURRENT_DIR $PWD; }
add-zsh-hook -Uz preexec preexec_hook
add-zsh-hook -Uz chpwd chpwd_hook
