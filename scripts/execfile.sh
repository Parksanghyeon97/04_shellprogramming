#!/bin/bash


echo -n "file name? : "
read FILENAME

# echo $FILENAME

if [ -x $FILENAME ] ; then
        echo "you have x "
        eval $FILENAME
    else
        echo "you don't have x"
fi