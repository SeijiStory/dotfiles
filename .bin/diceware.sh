#!/bin/mksh
if [ $# -ge 1 ]; then
	RANGE=$1
else
	RANGE=6
fi
echo $RANGE
PASS=""
for i in `seq 1 $RANGE`; do
	A=`grep -m1 -ao '[1-6]' /dev/urandom | sed s/0/10/ | head -n1`
	B=`grep -m1 -ao '[1-6]' /dev/urandom | sed s/0/10/ | head -n1`
	C=`grep -m1 -ao '[1-6]' /dev/urandom | sed s/0/10/ | head -n1`
	D=`grep -m1 -ao '[1-6]' /dev/urandom | sed s/0/10/ | head -n1`
	E=`grep -m1 -ao '[1-6]' /dev/urandom | sed s/0/10/ | head -n1`
	F="$A$B$C$D$E"
	WORD=`grep $F $HOME/.diceware | /bin/tail -c+7`
	PASS="$PASS $WORD"
done
echo $PASS
