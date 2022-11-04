# 本仓库不再维护 迁移置 [yaocccc/omz](https://github.com/yaocccc/omz)


# ZSH

zsh配置 基于ohz精简 启动速度稳定在0.1s内  

## USAGE

```shell
  cd ~/.config
  git clone https://github.com/yaocccc/zsh
  echo 'source ~/.config/zsh/init.zsh' >> ~/.zshrc
```

## REQUIRES

- zsh
- fzf
- fd
- bat (可选 更好的文本预览效果)
- exa (可选 更好的ls预览效果)

```plaintext
  请自行安装fd
  On macOS: brew install fd
  On Arch Linux: pacman -S fd
  On Ubuntu: apt install fd-find && ln -s $(which fdfind)
  On Debian: sudo apt-get install fd-find && ln -s $(which fdfind) ~/.local/bin/fd

  请自行安装fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
```

## PLUGINS

1. z  
    > `z keyword`  
    > 按使用频率跳转到keyword关联目录  
    > 例如 `z zsh` 可快速跳转到 `~/.config/zsh` 目录  

2. extract  
    > `extract xxx`  
    > extract一个压缩文件  
    > 可根据不同压缩文件类型进行解压 无需记忆长解压指令  

3. zsh-autosuggestions  
    > 输入命令时从history中找到最符合的命令  
    > \<right> 使用该 suggestion  

4. zsh-syntax-highlighting  
    > 高亮输入命令  

5. fzf-tab  
    > tab时使用fzf进行候选选择  

## 配置目录结构

```plaintext
.
├── cache/           -- 部分需要缓存的配置
├── config/
│   ├── fzf.zsh      -- fzf 及 fzf-tab配置
│   ├── git.zsh      -- git相关配置
│   ├── hook.zsh     -- 命令或启动钩子配置
│   └── zsh.zsh      -- zsh基础配置
├── plugins/         -- 插件
├── themes/          -- 主题
├── file_preview.sh  -- 文件预览脚本 for fzf-tab
├── init.zsh         -- 配置入口
├── README.md        -- README
└── omz.sh           -- 精简后的omz
```

## 主题

```plaintext
  优先载入 themes/_.zsh-theme
```

![avatar](./screenshots/show.gif)
