#!/bin/bash

alias cls="echo -ne '\033c'"

export PATH="$PATH:/opt/jdk1.8.0_91/bin"
export PATH="$PATH:~/bin:~/bin/food"
export PATH="$PATH:~/Android/Sdk/tools:~/Android/Sdk/platform-tools"

DEFAULT_TERM_TITLE="#!"

function mkcd() {
	mkdir $1; cd $1
}

function gpush() {
	BRANCH=`git branch | sed 's/^\* *//'`
	git push origin "$BRANCH"
}

function title() {
	[ -z $1 ] && TITLE=$DEFAULT_TERM_TITLE || TITLE="$DEFAULT_TERM_TITLE - $1"
	PROMPT_COMMAND='_update_ps1; echo -ne "\033]0;'"[$TITLE]"'\007"'
}

function _update_ps1() {
    PS1="$(~/Downloads/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
