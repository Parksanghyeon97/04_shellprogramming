#!/bin/bash

TMP1=/root/bin/report.txt

Usage(){
    echo "[ WARN ] choose option $0 U-1|U-2|U-3"
}

if [ $# -eq 1 ] ; then
case $1 in
    U-1) cat $TMP1 | sed -n '/U-1/,/U-2/p' | sed '$d' ;;
    U-2) cat $TMP1 | sed -n '/U-2/,/U-3/p' | sed '$d';;
    U-3) cat $TMP1 | sed -n '/U-3/,/$/p' ;;
    *) Usage ;;
esac

else
    Usage
fi

# case $1 in
#     U-1) cat $TMP1 | sed -n '/U-1/,/U-2/p' | sed '$d' ;;
#     U-2) cat $TMP1 | sed -n '/U-2/,/U-3/p' | sed '$d';;
#     U-3) cat $TMP1 | sed -n '/U-3/,/$/p' ;;
#     *) Usage ;;
# esac