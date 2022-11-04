# 以下hook主要解决新启动终端时 尽可能在当前目录下打开新终端 而非进入home目录

# hook1 切换目录时 将pwd写入cache/pwd中
# hook2 执行命令时 修改当前终端名称为最后执行的命令
chpwd_hook() { echo $PWD > $ZSH/cache/currentdir }
preexec_hook() { _cmd=($(echo $2)); print -n "\e]2;${(q)_cmd[1]}\a"; }
add-zsh-hook -Uz chpwd chpwd_hook
add-zsh-hook -Uz preexec preexec_hook

# 启动时 尝试从cache/pwd中读取上次的pwd 并切换到该目录
currentdir=$(cat $ZSH/cache/currentdir 2>/dev/null)
[ -d "$currentdir" ] && cd $currentdir
