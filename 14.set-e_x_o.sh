#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
set -x #debug mode
set -e #exit when script error
error(){
    echo "failed at $1 : $msg"
}

trap 'error ${LINENO} "$BASH_COMMAND"' ERR

if [ $USERID -ne 0 ]
then echo -e "$R Switch to super user $N"
exit 1
else echo -e " $G U R Super User $N"
fi

dnf install gitt -y
dnf install mysq -y
echo -e " $G installed git & Mysql $N"

