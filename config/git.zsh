alias git='git --no-pager'
alias gco='git checkout'
alias ginit='git init && echo "[user]\n    email = flyforest@outlook.com" >> .git/config'
alias gpo='git push origin $(git symbolic-ref --short -q HEAD)'
alias gpt='git push origin --tags'
alias gpl='git pull origin $(git symbolic-ref --short -q HEAD) --ff-only'
alias gd='git diff'
alias gs='git status'
alias gss='git status -s'
gam() { git add --all && git commit -m "$*" }
gitlog() {
    git --no-pager log --pretty=format:$1 --graph   -n ${2-10} \
}
gll() { gitlog "%h %s" $1 }
glll() { gitlog "%H %cd %cn: %s" $1 }
