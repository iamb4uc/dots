#!/bin/sh

#================================================#
# Simple script for animated wallpaper in feh.
# Creator: Rvtsv
#================================================#
val="1"

#DELAY 
DELAY="sleep 0.010"

#PATH OF THE FRAMES
PATHFRAME="${HOME}/wallpapergif"

#FRAME FORMAT
FORMAT="jpg"

#THE QUANTITY OF FRAMES YOU'LL USE 
totalframes="16"

#BACKGROUND (OPTIONS: center, max, scale, fill, tile )
BG="--bg-center"

type feh || { echo "You need feh!" ; exit 1 ; }
f="feh --no-fehbg ${BG} ${PATHFRAME}"

while [ "$val" -ne "$totalframes" ]; do	
	${f}/${val}.${FORMAT}
	val=$(($val+1))
	if [ "$val" = "$totalframes" ]; then
		val=1
	fi
	${DELAY}
done
