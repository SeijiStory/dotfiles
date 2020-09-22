#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


export QT_STYLE_OVERRIDE=GTK+
gsettings set org.gnome.desktop.interface gtk-theme Arc-Dark &
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1 &
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2 &
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200 &
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5 &
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.95 &
xinput --set-prop 10 'libinput Accel Speed' 0.5
synclient TouchpadOff=1 &
mpd &
xbindkeys &
compton -bc --mark-ovredir-focused --config ~/.config/compton.conf &
hsetroot -solid "#1A1A25" &
cmst &
ibus-daemon -drx &
urxvtd &
unclutter &
xmodmap ~/.Xmodmap &
redshift-gtk &
xcalib ~/Documents/Monitor_17.11.2011_1.icc &
xgamma -gamma 0.8 &
xsetwacom --set "Wacom Graphire4 4x5 Pen stylus" Area 0 0 10208 5739
