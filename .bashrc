#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1=' \w >> '
# source /etc/profile.d/plan9.sh

# Exports
export PATH=$PATH:$HOME/.bin
export XDG_DESKTOP_DIR=$HOME/Downloads
export TERM=xterm
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export _JAVA_OPTIONS="-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
export EDITOR=vim
export EXPLORER=pcmanfm
export LS_COLORS="$LS_COLORS:ow="
export SCHEME=chibi-scheme
export ROLLS=101
export DOOMWADDIR="$HOME/Downloads/WADs/"

# Aliases
alias ls='ls -XL --file-type --color=never --group-directories-first'
alias password='passwords.sh'
alias transmission='transmission-remote-cli'
alias trans='transmission-remote-cli'
alias scheme="rlwrap -r -c -f ~/.scheme_completion $SCHEME"
alias mitscheme="rlwrap -r -c -f ~/.scheme_completion mitscheme"
alias racket="rlwrap -r -c -f ~/.scheme_completion racket"
alias fucking="sudo"
alias mkdir="mkdir -p"
alias nano="echo kill yourself"
alias rc="rlwrap -rc 9 rc"
alias yt="youtube-viewer"
alias mpsyt="youtube-viewer"
alias mkcd=". mkcd.sh"
alias mksh="mksh -li"

# gsettings set org.gnome.Evince allow-links-change-zoom false 
