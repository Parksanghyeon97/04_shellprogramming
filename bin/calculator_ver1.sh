#!/bin/bash

echo -n "Enter A : "
read A

echo -n "Enter B : "
read B

#echo $A $B

cat << EOF
==============================================
 (1). +    (2). -    (3). *    (4). /
==============================================
EOF

echo -n "Enter Your Choice ? : "
read OP

case $OP in
    1) echo "$A + $B = $(expr $A + $B)" ;;
    2) echo "$A - $B = $(expr $A - $B)" ;;
    3) echo "$A * $B = $(expr $A \* $B)" ;;
    4) echo "$A / $B = $(expr $A / $B)" ;;
    *) echo "[fail]" ; exit 1 ;;
esac