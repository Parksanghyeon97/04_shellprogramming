#!/bin/bash

TMP1=/tmp/tmp1

DATE=$(date +'%Y.%m.%d %H:%M:%S')
NAME="SANG HYEON"
# echo -n "Enter your name : "
# read NAME
OS=$(cat /etc/centos-release)
KERNEL=$(uname -sr)
CPUS=$(lscpu | grep '^CPU(s)' | awk '{print $2}')
MEM=$(free -h | grep '^Mem' | awk '{print $2}')
DISKS=$(lsblk -S | awk '$3 == "disk" {print $0}' | wc -l)

SEQ=$(nmcli connection | grep -vw " -- " | tail -n +2 | wc -l)

nmcli connection | grep -vw " -- " | tail -n +2 | awk '{print $4}' > $TMP1

cat << EOF

Server Vul. Checker version 1.0
DATE: $DATE
NAME: $NAME

(1) Server Information
============================================
OS : $OS
Kernel : $KERNEL
CPU : $CPUS
MEM : $MEM
DISK : $DISKS

EOF


DNS=$(for i in $(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
do
    echo -n "$i "
done)

for i in $(seq $SEQ)
do
    NIC=$(sed -n "${i}p" $TMP1)
    cat << EOF
Network ${i} ($NIC): 
	*IP : $(ifconfig $NIC | grep 'inet ' | awk '{print $2}')
	*Netmask : $(ifconfig $NIC | grep 'inet ' | awk '{print $4}')
EOF
done

echo "        *Defaulrouter : $(ip route | grep default | awk '{print $3}')"
echo "        *DNS : $DNS"