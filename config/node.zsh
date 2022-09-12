# nodejs 相关配置
alias ts='ts-node'
alias ns='npm run start'
alias nb='npm run build'

# nvm 相关配置 写死node路径可以大幅度提升启动速度
export NVM_DIR="$HOME/.nvm"
nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }
export PATH=$HOME/.nvm/versions/node/v16.8.0/bin/:$PATH
