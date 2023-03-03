#!/bin/bash

echo -n "Enter A : "
read A

echo -n "Enter Operator :"
read OP

echo -n "Enter B : "
read B

#echo $A $B

case $OP in
    '+') echo "$A + $B = $(expr $A + $B)" ;;
    '-') echo "$A - $B = $(expr $A - $B)" ;;
    '*') echo "$A * $B = $(expr $A \* $B)" ;;
    '/') echo "$A / $B = $(expr $A / $B)" ;;
    *) echo "[fail]" ; exit 1 ;;
esac