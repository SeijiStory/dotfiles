#!/bin/mksh

NUM=""
if [ $# -eq 0 ]; then
        return 1
fi


if [ "$1" == "-n" ]; then
        ROLLS="$2"
else
        ROLLS=`expr $# \* 100`
fi

touch /tmp/roll
touch /tmp/result
# printf "" > /tmp/roll
# printf "" > /tmp/result
for i in `seq 1 $ROLLS`; do
        rand 1 $# >> /tmp/roll
done
for i in `seq 1 $#`; do
        eval printf "$`echo $i`" >> /tmp/result
        printf "\t\t" >> /tmp/result
        printf "`cat "/tmp/roll" | grep $i | wc -m` wins" >> /tmp/result
        printf '\n' >> /tmp/result
done
cat /tmp/result | sort -k2nr | nl
rm /tmp/roll
rm /tmp/result
