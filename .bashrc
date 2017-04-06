#!/bin/bash

alias cls="echo -ne '\033c'"

alias ranger="python3 /usr/bin/ranger"
alias getTz="curl -s https://timezoneapi.io/api/ip/?`curl -s icanhazip.com` | jq '.data .timezone .id'"

export PATH="$PATH:/opt/jdk1.8.0_91/bin"
export PATH="$PATH:~/bin:~/bin/food"
export PATH="$PATH:~/dotfiles/bin"
export PATH="$PATH:~/Android/Sdk/tools:~/Android/Sdk/platform-tools"

DEFAULT_TERM_TITLE="#!"

function mkcd() {
	mkdir $1; cd $1
}

function gpush() {
	BRANCH=`git branch | grep \* | sed 's/^\* *//'`
	git push origin "$BRANCH"
}

function title() {
	[ -z $1 ] && TITLE=$DEFAULT_TERM_TITLE || TITLE="$DEFAULT_TERM_TITLE - $1"
	PROMPT_COMMAND='echo -ne "\033]0;'"[$TITLE]"'\007"'
}

function _update_ps1() {
    PS1="$(~/Downloads/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

function get_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! -z "$BRANCH" ]; then
		echo " ($BRANCH)"
	fi
}

function userram() {
	for USER in $(ps haux | awk '{print $1}' | sort -u)
	do
		ps haux | awk -v user=$USER '$1 ~ user { sum += $4} END { print user, sum; }'
	done
}

eval `dircolors -b "$HOME/.dir_colors"`

PROMPT_USER="\033[32m\]\u\033[00m\]"
PROMPT_HOST="\033[32m\]\h\033[00m\]"
PROMPT_PWD='\033[1;36m\]$(~/dotfiles/bin/shortenPath.sh "$PWD" 20)\033[00m\]'
PROMPT_BRANCH='\033[1;31m\]$(get_git_branch)\033[00m\]'
PROMPT_TIME="\033[36m\]\@\033[00m\]"

 PS1="┌─[$PROMPT_USER on $PROMPT_HOST in $PROMPT_PWD$PROMPT_BRANCH at $PROMPT_TIME]╼\n└──╼ "
