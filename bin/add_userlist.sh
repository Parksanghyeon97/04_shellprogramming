#!/bin/bash

#   #cat user.list
#   user50 user50
#   ...
#   user100 user100

USERFILE=/root/bin/user.list
> $USERFILE

for i in $(seq 50 100)
do
    echo "user$i user$i" >> $USERFILE
done