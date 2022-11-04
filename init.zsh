export ZSH=~/.config/zsh
source $ZSH/config/git.zsh
source $ZSH/config/zsh.zsh
source $ZSH/config/fzf.zsh
source $ZSH/config/hook.zsh

# Load the private config if it exists
for file in $ZSH/config/private*.zsh; do
  source $file
done
