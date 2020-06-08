cat $HOME/.config/htop/htoprc~ > $HOME/.config/htop/htoprc
# If not running interactively, don't do anything
source /etc/profile.d/plan9.sh
PS1=" \$PWD >> "

# Exports
export CCOMPILER="tcc"
export EDITOR=nvim
export EDUKE32_MUSIC_CMD="fluidsynth -a alsa -m alsa_seq -l /home/seiji/Soundfont/Nokia_30.sf2"
export ENV=$HOME/.kshrc
export EXPLORER=spacefm
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export GTK_IM_MODULE=ibus
export HISTFILE=$HOME/.ksh_history
export HISTSIZE=512
export LS_COLORS="$LS_COLORS:ow="
export MANPAGER=less
export PAGER=less
export PATH=$PATH:$HOME/.bin
export QT_IM_MODULE=ibus
export SCHEME=chibi-scheme
export TERM=xterm
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DESKTOP_DIR=$HOME/Downloads
export XMODIFIERS=@im=ibus
export _JAVA_OPTIONS="-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
