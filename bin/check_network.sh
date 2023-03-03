#!/bin/bash

. /root/bin/functions.sh

# [*] ping 192.168.10.2
# [+] [  OK  ] Local Network Connection
# [-] [ FAIL ] Local Network Connection

# [*] ping 168.126.63.1
# [+] [  OK  ] External Netwrok Connection

# [*] nslookup www.daum.net
# [+] [  OK  ] DNS Client Configuration

IP1=192.168.10.2
IP2=8.8.8.8
IP3=www.google.com
print_info "(1) ping $IP1"
ping -c 1 $IP1 -W 2 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good "Local Network Connection"
else
    print_error "Local Network Connection"
    echo "  (ㄱ) 물리적인 연결 확인"
    echo "  # ethtool<NIC>"
    echo "  (ㄴ) IP/NETMASK 확인"
    echo "  # ip addr"
    echo "  (ㄷ) VMware VMnet8 설정"
    echo "  # VMware > Edit > Virtual Network Editor > VMnet8 > 192.168.10.0/255.255.255.0"
    echo "  (ㄹ) VMware 서비스 확인"
    echo "  services.msc > VMware* 확인"
fi

print_info "(2) ping $IP2"
ping -c 1 $IP2 -W 2 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good "External Netwrok Connection"
else
    print_error "External Netwrok Connection"
    echo "  (ㄱ) # ip route (# route -n)"
fi

print_info "(3) ping $IP3"
ping -c 1 $IP3 -W 2 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good "DNS Client Configuration"
else
    print_error "DNS Client Configuration"
    echo "  (ㄱ) # cat /etc/resolv.conf"
fi

