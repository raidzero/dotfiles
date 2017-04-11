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

function get_git_branch() {
	if [ -d .git ]; then 
		BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`

		if [ ! -z "$BRANCH" ]; then
			echo " ($BRANCH)"
		fi
	fi
}

function userram() {
	for USER in $(ps haux | awk '{print $1}' | sort -u)
	do
		ps haux | awk -v user=$USER '$1 ~ user { sum += $4} END { print user, sum; }'
	done
}
