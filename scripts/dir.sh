#!bin/bash

echo -n "Enter Your Filename ? : "
read FILENAME

# echo $FILENAME

if [ -f $FILENAME ] ; then
    echo "file is a regular file"

elif [ -d $FILENAME ] ; then
    echo "file is a Directory."
else
    echo "I don't know"
fi