#!/bin/mksh
BLOCK=1000
ROOT=$(df / | tail -n +2 | awk '{ print $4 }')
HOME=$(df /home | tail -n +2 | awk '{ print $4 }')
SHARE=$(df /media/share | tail -n +2 | awk '{ print $4 }')
# SPACE=5000000
if [ $ROOT -lt $(python -c "print($BLOCK ** 2)") ]; then
        printf '💽 '
        python -c "print(\"%01.1fM\" % ($ROOT / $BLOCK),end='')"
else
        printf '💽 '
        python -c "print(\"%01.1fG\" % ($ROOT / $BLOCK**2),end='')"
fi

if [ $HOME -lt $(python -c "print($BLOCK ** 2)") ]; then
        printf ' / '
        python -c "print(\"%01.1fM\" % ($HOME / $BLOCK),end='')"
else
        printf ' / '
        python -c "print(\"%01.1fG\" % ($HOME / $BLOCK**2),end='')"
fi


if [ $SHARE -lt $(python -c "print($BLOCK ** 2)") ]; then
        printf ' / '
        python -c "print(\"%01.1fM\" % ($SHARE / $BLOCK),end='')"
else
        printf ' / '
        python -c "print(\"%01.1fG\" % ($SHARE / $BLOCK**2),end='')"
fi


