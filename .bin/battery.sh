CHARGE=`acpi | /bin/awk -F' ' '{print $4}' | head -c-2`
TIME=`acpi | /bin/awk -F' ' '{print $5}' | head -c-4`
STATUS=`acpi | /bin/awk -F' ' '{print $3}' | head -c-2`
if [ -z `echo $TIME | grep "[0-9].*"` ]; then
        echo "$CHARGE (?)"
elif [ $STATUS == "Charging" ]; then
        echo -e "\033[0;32m`echo $CHARGE | head -c-2` ($TIME)\033[0;0m"
elif [ $STATUS == "Discharging" ]; then
        echo -e "`echo $CHARGE | head -c-2` ($TIME)"
else
        echo "$CHARGE"
fi
