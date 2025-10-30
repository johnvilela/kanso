alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gca="git commit -a"
alias gcm="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gb="git branch"
alias gd="git diff"
alias gco="git checkout"
alias gcl="git clone"
alias gmv="git mv"
alias grm="git rm"
alias glog="git log --oneline --graph --decorate --all"
alias gac="git add . && git commit -m"
alias grh="git reset --hard"
alias gst="git stash"
alias gstp="git stash pop"
alias gsta="git stash apply"
alias gsw="git switch"

alias vpn="sudo openfortivpn -c ~/.openforticonfig --saml-login"

starship init fish | source

$HOME/.local/bin/mise activate fish | source
