
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Take you to the dir of a file in a gem. e.g. `2gem rspec`
2gem () {
  cd "$(dirname $(gem which $1))"
}

cdls () {
  cd "$@" && ls -lFGgohq;
}

alias dotfiles="cd ~/.dotfiles && l"
alias md="touch ~/notes/new_note.md && vim ~/notes/new_note.md"
alias sbp="source ~/.bash_profile"
alias vbp="vim ~/.bash_profile; source ~/.bash_profile"

# disable control flow commands to remap <c-s> in vim
stty -ixon

# Git aliases
alias gs="git status"
alias gd="git diff --patience --ignore-space-change"
alias gcb="git checkout -b"
alias gcheck="git checkout"
alias gb="git branch"
alias gbr="git branch -r"
alias ga="git add"
alias gh="git hist"
alias gcm="git commit -m"
alias gr="git remote -v"
alias gra="git remote add"
alias gf="git fetch"
alias gpush="git push"
alias push="git push"
alias gpull="git pull --rebase"
alias pull="git pull --rebase"
alias devs="./bin/webpack-dev-server"
alias build='./node_modules/.bin/eslint app/javascript/ app/javascript/components && yarn test && rubocop && bundle exec rails test '\''test/**/*_test.rb'\'''
alias cu='git pull upstream xyz --rebase && git push origin xyz'
alias data_reset='rake db:drop && rake db:setup && rake db:migrate && rake db:fixtures:load && rake db:seed'
alias test='bundle exec rails test '\''test/**/*_test.rb'\'
alias cypress='yarn run cypress open'
alias cypresschrome='yarn run cypress run --browser chrome'

#sweeps
alias sweeps='cd ~/sweeps && vim'

#launchnotes
alias lnotes='cd ~/launchnotes'
alias start='cd ~/launchnotes && ./start && pm2 stop puma && cd backend && ./bin/puma -C ./config/puma.rb'
alias stop='cd ~/launchnotes && ./stop'
alias lnreset='cd ~/launchnotes && ./stop && cd backend && rake graphql:schema:dump && cd .. && ./start'
alias puma='arch -x86_64 ./bin/puma -C ./config/puma.rb'

#RiderDemand project
alias rd='cd ~/Turing/projects/RiderDemand && vim'

#my blog
alias blog='cd ~/Turing/projects/personal_blog && vim'

# shortcut to vimrc
alias vimrc="vim ~/.vimrc"

# shortcut to bash_profile
alias bash="vim ~/.bashrc"

# fancy ls command
# -l  long format
# -F  / after dirs, * after exe, @ after symlink
# -G  colorize
# -g suppress owner
# -o suppress group
# -h humanize sizes
# -q print nongraphic chars as question marks
alias l="ls -lFGgohq"

# git auto-completion
source ~/.git-completion.bash

# give the fullpaths of files passed in argv or piped through stdin
function fullpath {
ruby -e '
$stdin.each_line { |path| puts File.expand_path path }  if ARGV.empty?
ARGV.each { |path| puts File.expand_path path }         unless ARGV.empty?
' "$@"
}

# Shortcut for bundle exec
alias be="bundle exec"

# Prompt
function parse_git_branch {
branch=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
if [ "HEAD" = "$branch" ]; then
  echo "(no branch)"
else
  echo "$branch"
fi
  }

  function prompt_segment {
  # for colours: http://en.wikipedia.org/wiki/ANSI_escape_code#Colors
  # change the 37 to change the foreground
  # change the 45 to change the background
  if [[ ! -z "$1" ]]; then
    echo "\[\033[${2:-30};46m\]${1}\[\033[0m\]"
  fi
}

function build_mah_prompt {
# time
ps1="$(prompt_segment " \@ ")"

# cwd
ps1="${ps1} $(prompt_segment " \w ")"

# git branch
git_branch=`parse_git_branch`
if [[ ! -z "$git_branch" ]]
then
  ps1="${ps1} $(prompt_segment " $git_branch " 34)"
fi

# next line
ps1="${ps1}\n\$ "

# set prompt output
PS1="$ps1"
}

PROMPT_COMMAND='build_mah_prompt'
export PATH="/usr/local/bin:$PATH"

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
