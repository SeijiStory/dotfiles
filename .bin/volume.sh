# VOLUME=$(pactl list sinks | grep "Volume:" | sed -n '3p' | awk '{print $5}' | /bin/sed -e 's/\%//g')
VOLUME=$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }' | head -c-2)
echo "🔊 $VOLUME"
