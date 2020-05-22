#!/bin/bash
WIFI=`cat /sys/class/net/wlp3s0/operstate`
if [ $WIFI == "down" ]; then
        echo "📦 off"
else
        ARCH=`checkupdates | wc -l`
        AUR=`checkupdates-aur | wc -l`
        echo "📦 $ARCH/$AUR"
fi
