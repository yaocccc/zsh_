# ZSH

zsh配置 基于ohz精简 启动速度稳定在0.1s内  

## USAGE

```shell
  cd ~/.config
  git clone https://github.com/yaocccc/zsh
  echo 'source ~/.config/zsh/init.zsh' >> ~/.zshrc
```

## REQUIRES

以下依赖请自行安装

- zsh
- fzf
- bat
- fd

## 插件列表(只保留最精简实用):  

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
│   ├── private.zsh  -- !!!私有配置 注意此文件不会跟着git版本变更 若个人有需要的特定配置可写入该文件!!!
│   ├── fzf.zsh      -- fzf 及 fzf-tab配置
│   ├── git.zsh      -- git相关配置
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
  可自定义内容:
  可在环境变量中自定义PCNAME变量
  主题将展示 {PCNAMAE}{pwd}[gitstatus]
  以此来区分不同的使用环境
```

![avatar](./screenshots/show.gif)
