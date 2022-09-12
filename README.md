# ZSH

个人zsh配置 主要基于ohz精简 启动速度稳定在0.1s内

## 配置目录结构

```plaintext
.
├── cache/           -- 部分需要缓存的配置
├── config/
│   ├── private.zsh  -- !!!私有配置 注意此文件不会跟着git版本变更!!!
│   ├── base.zsh     -- 基础配置
│   ├── fzf.zsh      -- fzf 及 fzf-tab配置
│   ├── git.zsh      -- git相关配置
│   ├── node.zsh     -- nodejs配置 如果不使用nodejs的话 不需要该配置
│   └── zsh.zsh      -- zsh基础配置
├── plugins/         -- 插件
├── themes/          -- 主题
├── file_preview.sh  -- 文件预览脚本 for fzf-tab
├── init.zshrc       -- 配置入口
├── README.md        -- README
└── omz.sh           -- 精简后的omz
```
## 插件列表

1. extract                 智能解压缩命令 可使用 extract 解压任意压缩格式文件
2. fzf-tab                 使用fzf面板替换普通tab后的结果
3. z                       使用z dir命令 跳到常去目录
4. zsh-autosuggestions     猜测输入的命令 大幅度提升输入长命令的速度
5. zsh-syntax-highlighting 高亮命令

## USAGE

```shell
  # clone 配置目录
  cd ~/.config
  git clone https://github.com/yaocccc/zsh

  # 向zshrc中加入配置目录的source
  echo 'source ~/.config/zsh/init.zsh' >> ~/.zshrc
  
  # 需要自己手动安装fzf!!! 详情见 https://github.com/junegunn/fzf
```
## 展示

![avatar](./screenshots/show.gif)
