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

function luksMount() {
	DEV=$1
	NAME=$2

	sudo luksOpen $DEV $NAME

	if [ $? -eq 0 ]; then
		[ ! -d /mnt/$NAME ] && mkdir /mnt/$NAME
		sudo mount /dev/mapper/$NAME /mnt/$NAME
	fi
}

function luksUmount() {
	NAME=$1
	sudo umount /mnt/$NAME
	sudo luksClose /dev/mapper/$NAME
}

news() {
if [ "$PS1" ] && [[ $(ping -c1 www.google.com 2>&-) ]]; then
    # The characters "£, §" are used as metacharacters. They should not be encountered in a feed...
    echo -e "$(echo $(curl --silent https://www.archlinux.org/feeds/news/ | awk ' NR == 1 {while ($0 !~ /<\/item>/) {print;getline} sub(/<\/item>.*/,"</item>") ;print}' | sed -e ':a;N;$!ba;s/\n/ /g') | \
        sed -e 's/&amp;/\&/g
        s/&lt;\|&#60;/</g
        s/&gt;\|&#62;/>/g
        s/<\/a>/£/g
        s/href\=\"/§/g
        s/<title>/\\n\\n\\n   :: \\e[01;31m/g; s/<\/title>/\\e[00m ::\\n/g
        s/<link>/ [ \\e[01;36m/g; s/<\/link>/\\e[00m ]/g
        s/<description>/\\n\\n\\e[00;37m/g; s/<\/description>/\\e[00m\\n\\n/g
        s/<p\( [^>]*\)\?>\|<br\s*\/\?>/\n/g
        s/<b\( [^>]*\)\?>\|<strong\( [^>]*\)\?>/\\e[01;30m/g; s/<\/b>\|<\/strong>/\\e[00;37m/g
        s/<i\( [^>]*\)\?>\|<em\( [^>]*\)\?>/\\e[41;37m/g; s/<\/i>\|<\/em>/\\e[00;37m/g
        s/<u\( [^>]*\)\?>/\\e[4;37m/g; s/<\/u>/\\e[00;37m/g
        s/<code\( [^>]*\)\?>/\\e[00m/g; s/<\/code>/\\e[00;37m/g
        s/<a[^§|t]*§\([^\"]*\)\"[^>]*>\([^£]*\)[^£]*£/\\e[01;31m\2\\e[00;37m \\e[01;34m[\\e[00;37m \\e[04m\1\\e[00;37m\\e[01;34m ]\\e[00;37m/g
        s/<li\( [^>]*\)\?>/\n \\e[01;34m*\\e[00;37m /g
        s/<!\[CDATA\[\|\]\]>//g
        s/\|>\s*<//g
        s/ *<[^>]\+> */ /g
        s/[<>£§]//g')\n\n";
fi
}

function pacupdate() {
	news

	echo "Proceed? [Y/N] "
	read p

	if [ "$p" == "y" ] || [ "$p" == "Y" ]; then
		sudo pacman -Syu
		cat /var/log/pacman.log | grep -E "pac(new|save)" | grep "`date +%Y-%m-%d`"
	fi
}
