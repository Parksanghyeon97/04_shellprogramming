#!/bin/bash

BASHRC=$HOME/.bashrc
#BASHRC=$HOME/bashrc.txt


cat << EOF >> $BASHRC
#####################################
#             개인 설정             #
#####################################

export LANG=en_US.UTF-8
export PS1='\[\e[31;1m\][\u@\[\e[33;1m\] \w]\\$ \[\e[m\]'
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

alias vscode='code --no-sandbox --user-data-dir ~/workspace'
alias chrome='/usr/bin/google-chrome --no-sandbox'

EOF