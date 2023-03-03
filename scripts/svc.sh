#!/bin/bash

if [ $# -ne 2 ] ; then
    echo "Usage: $0 <start|stop><service>"
    exit 1
fi

SCRIPTNAME=$0
ACTION=$1
SVC=$2

SVC.START(){
    systemctl enable $SVC >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        systemctl restart $SVC
        systemctl status $SVC
    else
        echo "[enable FAIL]"
        exit 3
    fi

}

SVC.STOP(){
    systemctl disable $SVC > /dev/null 2>&1
    if [ $? -eq 0 ] ; then
        systemctl stop $SVC
        systemctl status $SVC
    else
        echo "[disable FAIL]"
        exit 4
    fi
}

ERR_1(){
    echo "Usage: $SCRIPTNAME <start|stop><service>"
}

case $ACTION in
    start) SVC.START ;;
    stop) SVC.STOP ;;
    *) ERR_1 ; exit 2;;
esac

