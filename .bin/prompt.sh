#!/bin/mksh

cat ~/.x/.gtkrc-2.0 > ~/.gtkrc-2.0
echo "Which desktop do you want? [1]"
echo "[1] i3wm"
echo "[2] Openbox"
echo "[3] rio"
echo "[4] XFCE"
echo "[9] tmux"
echo "[0] Do not start X"
while true; do 
	read choice
	case $choice in
                1 | "")
			echo "i3wm..."
			cat $HOME/.x/.xinitrc > $HOME/.xinitrc
			cat $HOME/.x/i3 >> $HOME/.xinitrc
			startx > /dev/null
			break
			;;
		2)
			echo "Openbox..."
			cat $HOME/.x/.xinitrc > $HOME/.xinitrc
			cat $HOME/.x/openbox >> $HOME/.xinitrc
			startx > /dev/null
			break
			;;
		3)
			echo "rio..."
			cat $HOME/.x/.xinitrc > $HOME/.xinitrc
			cat $HOME/.x/rio >> $HOME/.xinitrc
			startx > /dev/null
			break
			;;
		4)
                        echo "XFCE..."
			cat $HOME/.x/.xinitrc > $HOME/.xinitrc
			cat $HOME/.x/xfce >> $HOME/.xinitrc
			startx > /dev/null
			break
			;;
		9)
			echo "tmux..."
			tmux
			break
			;;
		0)
			echo "Goodbye!"
			break
			;;
		*)
			echo "Please enter a valid choice."
			;;
	esac
done
