unameOut="$(uname -s)"
case "${unameOut}" in
        Linux*)     machine=Linux;;
        Darwin*)    machine=Mac;;
        CYGWIN*)    machine=Cygwin;;
        MINGW*)     machine=MinGw;;
        *)          machine="UNKNOWN:${unameOut}"
esac
if [ "$machine" != "Linux" ]; then
        PS1="\w $ "
        if [ -f "$HOME/.bashrc" ]; then
                . $HOME/.bashrc
        fi
        export PATH="$PATH:$HOME/.bin"
        alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
else
        if [ -f $HOME/.kshrc ]; then
                . $HOME/.kshrc
        elif [ -f "$HOME/.bashrc" ]; then
                . $HOME/.bashrc
        fi
        if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
                PS1=""
                PS1+='$(who):$(pwd -L | sed "s,^$HOME,~,") > '
                export DISPLAY=:0
        else
                # If not running interactively, don't do anything
                cat $HOME/.config/htop/htoprc~ > $HOME/.config/htop/htoprc
                source /etc/profile.d/plan9.sh
                PS1=""
                PS1+='$(pwd -L | sed "s,^$HOME,~,") $ '

                # Exports
                export CCOMPILER="tcc"
                export COUNTRY="CA"
                export DESKTOP_SESSION=gnome
                export EDITOR=nvim
                export EDUKE32_MUSIC_CMD="fluidsynth -a alsa -m alsa_seq -l $HOME/Soundfont/Nokia_30.sf2"
                export ENV=$HOME/.kshrc
                export EXPLORER=spacefm
                export GPG_TTY=$(tty)
                export GTK2_RC_FILES=$HOME/.gtkrc-2.0
                export GTK_IM_MODULE=ibus
                export HISTFILE=$HOME/.ksh_history
                export HISTSIZE=512
                export LS_COLORS="$LS_COLORS:ow="
                export LYNX_LSS="$HOME/lynx.lss"
                export MANPAGER=less
                export PAGER=less
                export PATH="$HOME/.bin:$PATH:$HOME/.dotnet/tools/"
                export POWERSHELL_TELEMETRY_OUTPUT=1
                export QT_IM_MODULE=ibus
                export SCHEME=mit-scheme
                export TERM=xterm
                export XDG_CONFIG_HOME=$HOME/.config
                export XDG_DESKTOP_DIR=$HOME/Downloads
                export XMODIFIERS=@im=ibus
                export _JAVA_OPTIONS="-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

                if [ -z $SSH_CLIENT ] && [ -z $TMUX ]; then
                        mpd --kill
                        mpd
                        amixer set Master `cat pulse.status` -q
                        $HOME/.bin/prompt.sh
                fi
        fi
fi
