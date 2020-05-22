#!/bin/mksh
BLOCK=1000
SPACE=$(df / | tail -n +2 | awk '{ print $4 }')
# SPACE=5000000
if [ $SPACE -lt $(python -c "print($BLOCK ** 2)") ]; then
        printf '💽 '
        python -c "print(\"%01.1f M\" % ($SPACE / $BLOCK))"
else
        printf '💽 '
        python -c "print(\"%01.1f G\" % ($SPACE / $BLOCK**2))"
fi
