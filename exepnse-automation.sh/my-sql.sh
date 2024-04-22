#!/bin/bash
USERID=$(id -u)
Timestamp=$(date +%F-%H-%M-%s)
script=$(echo $0|cut -d "." -f1)
log_file=/tmp/$Timestamp-$script.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $USERID -ne 0 ]
then echo -e " $R switch to root user $N "
exit 1
else echo -e " $G u r rot user $N " 
fi
validate (){ 
    if [ $1 -ne 0 ]
    then echo -e " $2 ...$R failed $N "
    exit 1
    else echo -e " $2 ...$G success $N "
    fi
}

dnf install mysql-server -y &>$log_file
validate $? " installing mysql"
systemctl enable mysqld &>$log_file
validate $? " enabling mysql"
systemctl start mysqld &>$log_file
validate $? " starting mysql"
mysql_secure_installation --set-root-pass ExpenseApp@1 &>$log_file
validate $? " setting usid&pwd mysql"



