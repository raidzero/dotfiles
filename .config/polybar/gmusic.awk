BEGIN {
	MUSIC_WINDOW_FOUND = 0

	while("wmctrl -l" | getline DATA) {
		if (DATA ~ /Google Play Music/) {
			MUSIC_WINDOW_FOUND = 1
			
			match(DATA, /chromebook * *(.*) *- *Google Play Music/, a)
			LEN = split(a[1], SONGDATA, " - ")
			
			if (LEN == 2) {
				print " "SONGDATA[2] " - " SONGDATA[1]
			} else {
				print ""
			}
	
			exit 0
		}
	}
	if (MUSIC_WINDOW_FOUND == 0) {
		exit 1
	}
}
