#!/bin/bash

if [ $# -ne 1 ] ; then
    echo "Usage : $0 <filename>"
    exit 2
fi

FILE1="$1"

FILESIZE=$(wc -c < "$FILE1")
# echo $FILESIZE

if [ $FILESIZE -ge 5120 ] ; then
    echo "too big = ($FILESIZE )byte"
else
    echo "too small = ($FILESIZE )byte"
fi