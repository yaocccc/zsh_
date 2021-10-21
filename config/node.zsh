alias ts='ts-node'
alias ns='npm run start'
alias nb='npm run build'
alias ng='npm run gen'
alias nt='npm run test'

export NVM_DIR="$HOME/.nvm"
nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }
export PATH=$HOME/.nvm/versions/node/v16.8.0/bin/:$PATH
