# 以下hook主要解决新启动终端时 尽可能在当前目录下打开新终端 而非进入home目录

# 切换目录时 将pwd写入cache/pwd中
chpwd_hook() { echo $PWD > $ZSH/cache/currentdir }
add-zsh-hook -Uz chpwd chpwd_hook

# 启动时从cache读取 vimdir、currentdir 优先进入vimdir
# PS: vimdir由vim开启终端前 执行 echo $pwd > $ZSH/cache/vimdir 指令
vimdir=$(cat $ZSH/cache/vimdir 2>/dev/null)
currentdir=$(cat $ZSH/cache/currentdir 2>/dev/null)

if [ -d "$vimdir" ]; then
    cd $vimdir
    echo > $ZSH/cache/vimdir
    echo $currentdir > $ZSH/cache/currentdir
elif [ -d "$currentdir" ]; then
    cd $currentdir
fi
