#!/bin/bash

COUNT=10
NUM=10


while [ $COUNT -le 101 ]
do
    echo -ne "$NUM% |"
    NUM=10
    while [ $NUM -le $COUNT ]
    do
        echo -ne "="
	    sleep 0.5	
	    NUM=`expr $NUM + 10`
    done
    echo -ne '>\n'
    COUNT=$(expr $COUNT + 10)
done

# echo -ne "$NUM% |"
# while [ $NUM -le 101 ]
# do
  
# 	echo -ne "="
# 	sleep 1	
# 	NUM=`expr $NUM + 10`
# done
# echo -ne '>\n'