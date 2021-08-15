#!/bin/sh
WIFI=`cat /sys/class/net/wlp3s0/operstate`
ETH=`cat /sys/class/net/enp0s25/operstate`
if [ $WIFI == "up" -o $ETH == "up" ]; then
        ARCH=`checkupdates | wc -l`
        AUR=`checkupdates-aur | wc -l`
        echo "📦 $ARCH/$AUR"
else
        echo "📦 off"
fi
