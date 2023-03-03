#!/bin/bash

TMP1=/test/fdisk1.txt
TMP2=/test/pvs1.txt
TMP3=/test/vgs_v.txt
TMP4=/test/test4.txt

# ----------------------------------------
# PV작업
# -----------------
# 보기


fdisk -l | grep LVM | awk '{print $1}' > $TMP1
pvs | tail -n +2 | awk '{print $1}' > $TMP2
# -------
#선택(ex: /dev/sdb1  /dev/sdc1 ...)?
while true
do
cat << EOF
==================== Disk List ========================
$(cat $TMP1 $TMP2 | sort | uniq -u)
=======================================================
EOF

# => 작업
echo -n "Choose PV : "
read USERPV

echo -n "아직 만들기 전인데 물어볼게) (1)계속진행  (2)돌아가기  (3)건너뛰기 "
read USERPOINT

case $USERPOINT in
    1) : ;;
    2) continue ;;
    3) break ;;
    *) continue ;;
esac



pvcreate $USERPV > /dev/null 2>&1

if [ $? -eq 0 ] ; then
    echo "[ OK ] PV = $USERPV successfully created "
else
    echo "[ FAIL ]"
    exit 1
fi

break
done
# ----

cat << EOF



EOF



# VG작업
# ------------------
# 보기
while true
do
pvs | tail -n +2 > $TMP4

for i in $(cat $TMP3)
do
    sed -i "/$i/d" $TMP4
done

cat << EOF
=================== PV List =======================
$(cat $TMP4)
===================================================
EOF

echo -n "Choose (1)VGname and (2)PVname :  "
read VGNAME PVNAME

echo -n "아직 만들기 전인데 물어볼게) (1)계속진행  (2)돌아가기  (3)건너뛰기 (4)작업종료 "
read USERPOINT

case $USERPOINT in
    1) : ;;
    2) continue ;;
    3) break ;;
    4) exit 2 ;;
    *) continue ;;
esac


# --------
# 선택
# => 작업

vgcreate $VGNAME $PVNAME > /dev/null 2>&1

if [ $? -eq 0 ] ; then
    echo "[ OK ] VG = $VGNAME successfully created "
else
    echo "[ FAIL ]"
    exit 2
fi

break
done 
# ---

cat << EOF



EOF

# LV 작업
# ------------------
# 보기

while true
do
cat << EOF
echo "================== VG List ====================="
$(vgs | awk ' $7 != '0' ' | tail -n +2)
echo "================================================"

EOF

echo -n "Choose (1)LVname and (2)VGname :  "
read LVNAME VGNAME2

echo -n "아직 만들기 전인데 물어볼게) (1)계속진행  (2)돌아가기  (3)건너뛰기 (4)작업종료 "
read USERPOINT

case $USERPOINT in
    1) : ;;
    2) continue ;;
    3) break ;;
    4) exit 2 ;;
    *) continue ;;
esac


# --------
# 선택
# => 작업
lvcreate $VGNAME2 -n $LVNAME -l 100%FREE > /dev/null 2>&1

if [ $? -eq 0 ] ; then
    echo "[ OK ] LV = $LVNAME successfully created "
else
    echo "[ FAIL ]"
    exit 3
fi

break
done

cat << EOF

echo "================== LV List ====================="
$(lvs)
echo "================================================"

EOF