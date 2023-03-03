배시 쉘 프로그래밍

1. 선수 지식

1) 명령어
	grep CMD
		# grep OPTIONS PATTERNS file1
		OPTIONS	: -i, -v, -l, -n, -r, -w
		PATTERNS: * . ^root root$ [abc] [a-c] [^a]   
		
	sed CMD
		p CMD) # sed -n '1,3p' /etc/hosts
		d CMD) # sed '1,3d' /etc/hosts
		s CMD) # sed -i '/main/s/192.168.10.10/192.168.10.20/' /etc/hosts
	awk	CMD
		# awk 'statement {action}' filename
		# awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' /etc/passwd
		# df -h / | tail -1 | awk '{print $6}' | awk -F% '{print $1}'
		# ifconfig eth0 | grep –w inet | grep -v inet6 | awk '{print $2}' | awk -F: '{print $2}'
		# ps -elf | awk '$2 == "Z" {print $0}'
	+
	CMD(sort CMD, cut CMD ....)
	
쉘의 특성
	*리다이렉션(Redirection) 		: <  <<  >  >>  2>  2>>
	*파이프(pipe)            		: |
	*셀 자체의 기능(bash function)  	: set -o vi
	*변수(Variable)				: export VAR=5
	*메타캐릭터(Metacharacter)		: ''  ""  ``  ;
	*히스토리(History)				: history
	*환경파일(Environment Files)	: /etc/profile, ~/.bash_profile, ~/.bashrc
	*함수(Function)				:(선언) # a() { ls; date; cal; }   or   function a { ls; date; cal; }
								 (실행) # a 
								 (확인) # typeset -f 
								 (해제) # unset -f a 
	*cat CMD + <<
	*그룹(Grouping)
	*&&, ||
	*	A && B
	*	A && B || C
	*	A || B
	
	*dirname/basename CMD
	----------------------------------------------------
		#!/bin/bash

		# filename: script.sh
		# log file : script.log
		# log file location : ./script.log
		
		LOGDIR=$(pwd)
		
		LOGFILE=$(basename $0 | sed 's/.sh$/.log/')
		
		touch $LOGDIR/$LOGFILE
		----------------------------------------------------
	*eval CMD
	
2) Shell Script/Shell Programming 

IDE ? 통합 개발 환경

LINUX) vscode

Bash IDE
Bash Debug
WINDOWS) vscode


1) 프로그램 작성과 실행
	# bash -x script.sh
	# . ~/.bashrc
	# vi script.sh ; chmod +x script.sh ; ./script.sh
	# vi script.sh ; chmod +x script.sh ; ./script.sh
	[참고] 매직넘버 (#!/bin/bash)

2) 주석
	한줄 주석 - #
	여러줄 주석 - : << EOF ~ EOF
				
3) 입력 & 출력
	출력 : echo CMD, printf CMD
	입력 : read CMD, scanf CMD
	
4) 산술 연산
	expr 1 + 4    /* 더하기 */
	expr 4 - 1    /* 빼기   */
	expr 4 \* 3   /* 곱하기 */
	expr 10 / 2   /* 나누기 */
	expr 10 % 3   /* 나머지 */
	
5) 조건문: if 문, case 문
	* if 문 
		if 조건; then
			statement1
		elif 조건; then
			statement2
		else
			statement3
		fi
		
	* case 문
		case VAR in
			조건1) statement1 ;;
			조건2) statement2 ;;
			*)	  statement3 ;;
		esac


6) 반복문: for 문, while 문
	* for 문 : for 문 + seq CMD
	
		for 변수이름 in 변수목록
		do
			statement
		done

	* while 문 :
		while 조건
		do
			statement
		done

7) 함수
	선언)
		fun() { CMD; CMD; }
		function fun { CMD; CMD; }
	실행) fun
	확인) typeset -f
	해제) unset -f fun
	
	함수입력: 인자($1, $2, $3, ... )
	함수출력: echo $RETURN
	
8) I/O 리다이렉션과 자식 프로세스

	for LINE in $(cat file1) //쪼개짐
	do
		echo $LINE
	done
-----------------------------------------
	cat file1 | while read LINE // 한줄
	do
		echo $LINE
	done

	for LINE in $(cat file1)
	do
		echo $LINE
	done > file2


	cat file1 | while read LINE
	do
		echo $LINE
	done > file2

9) 시그널 제어(Signal Trap)
	* 시그널 무시
	* 시그널 받으면 개발자가 원하는 동작
	
10) 디버깅
	* bash -x script.sh
	* bash -xv script.sh
	
11) 옵션 처리
	getopts CMD + while CMD + case CMD
	(예) # ssh.sh -p 80 192.168.10.20
	
	while getopts p: options
	do
		case $options in
			p	) P_ACTION ;;
			\?	) Usage ;;
			*	) Usage ;;
		esac
	done

	shift $(expr $OPTIND - 1)
	if [ $# -ne 1 ] ; then
		Usage
	fi
	echo "$# : $@"
	
	
vscode 자동으로 꺼지도록 설정

crontab +  vskill.sh
--------------------------------------------
#!/bin/bash

PID1=$(ps -ef | grep -w 'code' \
			| grep -v 'grep --color=auto' \
			| awk '{print $2}' \
			| sort -n | head -1)

echo $PID1

[ "$PID1" ] && kill $PID1
--------------------------------------------



LV(PV -> VG -> LV)
	./lvm.sh
	
filesystem
mount
------------

./lvm.sh
----------------------------------------
PV작업

pvs | tail -n +2 | awk '{print $1}'
fdisk -l | grep LVM | awk '{print $1}'
-----------------
보기
-------
선택(ex: /dev/sdb1  /dev/sdc1 ...)?
=> 작업
----

VG작업
------------------
보기
--------
선택
=> 작업
---

LV 작업
------------------
보기
--------
선택
=> 작업


	
#############################
■ 웹서버 설정하고 기동하기
#############################
■ Apache HTTPD 웹 서버 구성하기(https://httpd.apache.org/docs/)
* 방화벽이나 SELinux는 OFF 상태라고 가정한다.

■ Nginx 웹서버 구성하기(https://nginx.org/en/docs/)
* 방화벽이나 SELinux는 OFF 상태라고 가정한다.



	$$ : 현재 쉘의 PID 번호 저장(EX: 임시 파일 생성, /tmp/.tmp.$$)
	$! : 바로 이전 수행된 백그라운드 프로세스의 PID 번호 저장
	$? : 바로 이전 수행된 명령어의 return value 저장(0 ~ 255)

	$* : 모든 인자($* == $@)
	$# : 인자의 개수
	$0 : 프로그램 이름
	$1 : 프로그램에 대한 첫번째 인자
	$2 : 프로그램에 대한 두번째 인자
	$3 : 프로그램에 대한 세번째 인자
	
	
	
(1) 스크립트 
■ 파일명: ENV_main.sh(ENV1.sh, ENV2.sh, ENV3.sh)
■ 기능
● 환경 설정 스크립트를 제작한다.
● 운영체제를 초기에 설치 하고 난 이후에 세팅해야 하는 여러가지 작업이 있다.
● 대표적으로
(ㄱ) "환경파일" 설정   -> ENV1.sh
	*HOME/.bashrc
----------------------------
export LANG=en_US.UTF-8
export PS1='\[\e[31;1m\][\u@\[\e[33;1m\] \w]\$ \[\e[m\]'
alias lsf='ls -l | grep "^-"'
alias lsd='ls -l | grep "^d"'
alias ls='ls --color=auto -h -F'
alias c='clear'
alias pps='ps -ef | head -1 ; ps -ef | grep $1'
alias nstate='netstat -antup | head -2 ; netstat -antup | grep $1'
alias tree='env LANG=C tree'
alias vi='/usr/bin/vim'
alias grep='grep --color=auto -i'
alias df='df -h -T'
alias chrome='/usr/bin/google-chrome --no-sandbox'
alias RS='rsync -avz --delete -e ssh'
alias LS='rsync -av --delete'
alias fwcmd='firewall-cmd --permanent'
alias fwlist='firewall-cmd --list-all'
alias fwreload='firewall-cmd --reload'
alias named.conf='vi /etc/named.conf'
alias named.rfc1912.zones='vi /etc/named.rfc1912.zones'
alias DNS='cd /var/named'
----------------------------
(ㄴ) "패키지"설치	-> ENV2.sh
	*(gcc, php, vscode, chrome)
	
	rpm --import https://packages.microsoft.com/keys/microsoft.asc

cat << EOF > /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" 
EOF

yum install code
	

wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

	
(ㄷ) "서버" 세팅 -> ENV3.sh
	* telnet(root 사용자 접속 가능)
		# yum -y install telnet telnet-server
		# systemctl enable --now telnet.socket
		
	* ftp 서버(root 사용자 접속 가능)
		# yum -y install vsftpd ftp
		# sed -i 's/^root/#root/' /etc/vsftpd/ftpusers
		# sed -i 's/^root/#root/' /etc/vsftpd/user_list
		# systemctl enable --now vsftpd.service
		
	* ssh 서버(root 사용자 접속 가능)
		# yum -y install openssh-server openssh-clients openssh
		# sed -i 's/PermitRootLogin no/PermitRootLogin yes' /etc/ssh/sshd_config
		# sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
		
		# sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
		# sed -i 's/#PasswordAuthentication/PasswordAuthentication/' /etc/ssh/sshd_config
		# systemctl enable --now sshd.service
		
	* nginx web 서버(index.html)
		# yum -y install nginx
		# echo "Nginx WebServer" > /usr/share/nginx/html/index.html
		# systemctl enable --now nginx.service
	
	
연산자									설명
exprA -eq exprB			산술연산 exprA와 exprB가 같은 경우(-eq: equal)
exprA -ne exprB			산술연산 exprA와 exprB가 같지 않은 경우(-n: not equal)
exprA -lt exprB			산술연산 exprA가 exprB보다 작은 경우(-lt: less than)
exprA -le exprB			산술연산 exprA가 exprB보다 작거나 같은 경우(-le: less equal)
exprA -gt exprB			산술연산 exprA가 exprB보다 큰 경우(-gt: great than)
exprA -ge exprB			산술연산 exprA가 exprB보다 크거나 같은 경우(-ge: great equal)
exprA  -a exprB			exprA가 참이고 exprB가 참인경우
exprA  -o exprB			exprA가 참이거나 exprB가 참인경우

if [ -f $F_NAME.orig ] ; then 

-e file	파일이 존재하는 경우
-d file	파일이 존재하고 디렉토리인 경우
-f file	파일이 정규 파일인 경우
-b file	파일이 존재하고 블록 디바이스 파일인 경우
-c file	파일이 존재하고 문자 디바이스 파일인 경우
-p file	파일이 존재하고 파이프나 이름이 있는 파이프(FIFO 파일)인 경우
-S file	파일이 존재하고 소켓인 경우
-L file	파일이 존재하고 심볼릭 링크인 경우
-r file	파일이 존재하고 읽을 수 있는 경우
-w file	파일이 존재하고 쓰기 가능한 경우
-x file	파일이 존재하고 실행할 수 있는 경우
-u file	파일이 존재하고 SetUID 비트가 설정된 경우
-g file	파일이 존재하고 SetGID 비트가 설정된 경우
-k file	파일이 존재하고 Sticky 비트가 설정된 경우
-s file	파일이 존재하고 빈 파일이 아닌 경우

.
