#!/bin/bash

source $HOME/dotfiles/functions.sh

alias sudo='sudo '
alias cls="echo -ne '\033c'"
alias luksOpen="cryptsetup luksOpen"
alias luksClose="cryptsetup luksClose"
alias grep='grep --color'
alias pcp="rsync -ah --progress"
alias dropbox="python2 /usr/bin/dropbox"
alias btc='curl -sSL https://api.coinbase.com/v1/prices/historical?limit=1 | grep -oE "[0-9]+\.[0-9]{2}" | sed "s/^/$/"'

export PATH="$PATH:/opt/jdk1.8.0_91/bin"
export PATH="$PATH:~/bin:~/bin/food"
export PATH="$PATH:~/dotfiles/bin"
export PATH="$PATH:~/Android/Sdk/tools:~/Android/Sdk/platform-tools"

export EDITOR=vim
export SUDO_EDITOR=vim
export VISUAL=vim
export BROWSER=google-chrome-stable

DEFAULT_TERM_TITLE="#!"

eval `dircolors -b "$HOME/.dir_colors"`

PROMPT_USER='\e[32m\u\e[00m'
PROMPT_HOST='\e[35m\h\e[00m'
PROMPT_PWD='\e[1;36m$(~/dotfiles/bin/shortenPath.sh "$PWD" 30)\e[00m'
PROMPT_BRANCH='\e[1;31m$(get_git_branch)\e[00m'
PROMPT_TIME='\e[36m\@\e[00m'

PS1="┌─[$PROMPT_USER on $PROMPT_HOST in $PROMPT_PWD$PROMPT_BRANCH at $PROMPT_TIME]╼\n└──╼ "
PROMPT_COMMAND='echo -en "\033]0;[$DEFAULT_TERM_TITLE] - $(~/dotfiles/bin/shortenPath.sh "$PWD" 30)\007"'

set -o vi
