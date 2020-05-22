#!/bin/mksh
MPDSTATUS=`mpc status | head -n1 | tr A-Z a-z`
ISON=`echo $MPDSTATUS | awk '{print $1;}'`
if [ "$ISON" = "volume:" ] || [ "$ISON" = "volume:100%" ]; then
	echo "🎧 off";
else
        printf "🎧 "
	echo $MPDSTATUS | awk -v len=50 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }'
fi
