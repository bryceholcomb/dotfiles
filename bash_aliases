shopt -s expand_aliases

# Git aliases
alias gs="git status"
alias gd="git diff --patience --ignore-space-change"
alias gc="git checkout"
alias gb="git branch"
alias gbr="git branch -r"
alias ga="git add"
alias gh="git hist"
alias gcm="git commit -m"
alias gr="git remote -v"
alias gra="git remote add"
alias gf="git fetch"
alias gr="git rebase"
alias gpush="git push"
alias gpull="git pull"

alias build='bundle exec rails test '\''test/**/*_test.rb'\'''
alias cu='git pull upstream master --rebase && git push origin master'
alias data_reset='rake db:drop && rake db:setup && rake db:migrate && rake db:fixtures:load && rake db:seed'
