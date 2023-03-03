#!/bin/bash

. /root/bin/functions.sh

# * telnet(root 사용자 접속 가능)
# 		# yum -y install telnet telnet-server
# 		# systemctl enable --now telnet.socket
echo "########## TELNET Server ##########"
PkgInst "telnet telnet-server"
SvcEnable "telnet.socket"

# 	* ftp 서버(root 사용자 접속 가능)
# 		# yum -y install vsftpd ftp
# 		# sed -i 's/^root/#root/' /etc/vsftpd/ftpusers
# 		# sed -i 's/^root/#root/' /etc/vsftpd/user_list
# 		# systemctl enable --now vsftpd.service
echo "########## FTP Server ##########"
PkgInst "vsftpd ftp"
VsFtpConf
SvcEnable "vsftpd.service"

# 	* ssh 서버(root 사용자 접속 가능)
# 		# yum -y install openssh-server openssh-clients openssh
# 		# sed -i 's/PermitRootLogin no/PermitRootLogin yes' /etc/ssh/sshd_config
# 		# sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
		
# 		# sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
# 		# sed -i 's/#PasswordAuthentication/PasswordAuthentication/' /etc/ssh/sshd_config
# 		# systemctl enable --now sshd.service
echo "########## SSH Server ##########"
PkgInst "openssh-server openssh-clients openssh"
SshConf
SvcEnable "sshd.service"

# 	* nginx web 서버(index.html)
# 		# yum -y install nginx
# 		# echo "Nginx WebServer" > /usr/share/nginx/html/index.html
# 		# systemctl enable --now nginx.service
echo "########## WEB Server ##########"
CheckWebSvc "nginx"
PkgInst "nginx"
NginxConf
SvcEnable "nginx.service"