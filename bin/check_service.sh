#!/bin/bash

#   #./check_service.sh 192.168.10.10 192.168.10.20
# --------------
# 192.168.10.10
# --------------
# svc1  active
# svc2  active

# --------------
# 192.168.10.20
# --------------
# svc3  active
# svc4  active


DIR1=/test

rm -rf $DIR1/*
FIST_IP=$1
SECOND_IP=$2

if [ $# -ne 2 ] ; then
    echo "[ WRONG ]: $0 <IP1><IP2>"
fi



Make_txt(){
    ssh $FIST_IP systemctl -t service | \
                sed -n '1,/^LOAD/p' | \
                sed '$d' | \
                awk '{print $1,$3}' > $DIR1/$FIST_IP.txt

    ssh $SECOND_IP systemctl -t service | \
                    sed -n '1,/^LOAD/p' | \
                    sed '$d' | \
                    awk '{print $1,$3}' | \
                    sed -n '1,/^●/p' | \
                    sed '$d' > $DIR1/$SECOND_IP.txt
}

txt_diff(){

cat << EOF
    ############################
    $FIST_IP
    ############################

    $(diff $FIST_IP.txt $SECOND_IP.txt | fgrep "<" | awk '{print $2,$3}')

    ############################
    $SECOND_IP
    ############################

    $(diff $FIST_IP.txt $SECOND_IP.txt | fgrep ">" | awk '{print $2,$3}')

    ############################
    "$SECOND_IP" + "$FIST_IP"
    ############################

    $(cat $FIST_IP.txt $SECOND_IP.txt | sort | uniq -d)

EOF

    # echo "--------------"
    # echo $FIST_IP
    # echo "--------------"
    # diff $FIST_IP.txt $SECOND_IP.txt | fgrep "<" | awk '{print $2,$3}'


    # echo "--------------"
    # echo $SECOND_IP
    # echo "--------------"
    # diff $FIST_IP.txt $SECOND_IP.txt | fgrep ">" | awk '{print $2,$3}'
}

Make_txt
txt_diff