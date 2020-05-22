#!/bin/mksh

START=1
STR=""
if [ $# == "0" ]; then
        exit 1
fi
if [ "$1" == "-c" ]; then
        if [ $# == "1" ]; then
                exit 1
        fi
        START=2
        LOWER=':^)'
fi
A=65
Z=90
for i in `eval seq 1 '$'$START`; do
        CASING=`choose.sh -n 1 "caps" "lower" | awk '{print $2}' |  head -n1`
        if [ "$CASING" == "lower" ]; then
                A=97
                Z=122
        else
                A=65
                Z=90
        fi
        LETTER=$(dtox `rand $A $Z`)
        STR+="\\x$LETTER"
done
printf "$STR\n"
