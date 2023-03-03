#!/bin/bash

PASSWD=/etc/passwd


Menu(){
cat << EOF
(관리 목록)
------------------------------------
1) 사용자 추가
2) 사용자 확인
3) 사용자 삭제
4) 종료
------------------------------------
EOF
}

Useradd(){

echo "(사용자 추가)"
echo -n "추가할 사용자 이름? :"
read UNAME

$(useradd $UNAME >/dev/null 2>&1)
$(echo $UPASS | passwd --stdin $UNAME > /dev/null 2>&1)

    cat << EOF
------------------------------------
정상적으로 추가 되었습니다.
------------------------------------


EOF

}

UserVerify(){
    cat << EOF
(사용자 확인)
------------------------------------
$(awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' $PASSWD | cat -n)
------------------------------------

EOF
}

Userdel(){
echo "(사용자 삭제)"
echo -n "삭제할 사용자 이름? :"
read UNAME

userdel -r $UNAME


    cat << EOF
------------------------------------
정상적으로 삭제 되었습니다.
------------------------------------


EOF
}


while true
do
    Menu
    echo -n "선택 번호? (1|2|3|4) : "
    read NUM

    case $NUM in
    1) Useradd ;;
    2) UserVerify ;;
    3) Userdel ;;
    4) break ;;
    *) echo "[GO BACK]" ; echo
    esac
done