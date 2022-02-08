
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
source ~/.profile
[[ -s ~/.bashrc ]] && source ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bryceholcomb/google-cloud-sdk/path.bash.inc' ]; then . '/Users/bryceholcomb/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bryceholcomb/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/bryceholcomb/google-cloud-sdk/completion.bash.inc'; fi
export PATH="/usr/local/opt/node@14/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/opt/postgresql/bin:$PATH"
eval "$(rbenv init -)"

git config --global user.email brycecholcomb@gmail.com

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
