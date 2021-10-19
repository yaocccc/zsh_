alias fzf='fzf --preview "bat -p --color=always {} | head -100" --height 40%'

export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --history=/home/chenyc/.config/zsh/cache/fzfhistory"
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,dist} --type f"
export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat -n --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -10000'

FZF_TAB_COMMAND=(fzf --ansi --expect='$continuous_trigger,$print_query' '--color=hl:$(( $#headers == 0 ? 108 : 255 ))' --nth=2,3 --delimiter='\x00' --layout=reverse --height='${FZF_TMUX_HEIGHT:=75%}' --tiebreak=begin -m --bind=tab:down,btab:up,change:top,ctrl-space:toggle --cycle '--query=$query' '--header-lines=$#headers' --print-query --height 40%)
local extract="
in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
"

zstyle ':completion:complete:*:options' sort false
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'ls --color=always ${~ctxt[hpre]}$in'
zstyle ':fzf-tab:complete:vim:*' extra-opts --preview=$extract'[ -f ${~ctxt[hpre]}$in ] && bat -p --color=always ${~ctxt[hpre]}$in | head -100 || ls --color=always ${~ctxt[hpre]}$in'
