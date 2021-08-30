source $ZSH/plugins/zsh-vi-mode/zsh-vi-mode.zsh

bindkey -M viins '^h' backward-kill-word
bindkey -M vicmd '^h' backward-kill-word
bindkey -M viins '^u' zvm_kill_line
bindkey -M vicmd '^u' zvm_kill_line
bindkey -M vicmd '^a' beginning-of-line
bindkey -M vicmd '^e' end-of-line

ZVM_MODE_NORMAL='[N]'
ZVM_MODE_INSERT='[I]'
ZVM_MODE_VISUAL='[V]'
ZVM_MODE_VISUAL_LINE='[V]'
ZVM_MODE_REPLACE='[R]'
