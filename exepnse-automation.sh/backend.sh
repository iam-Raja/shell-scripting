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
dnf install nginx -y &>$log_file
validate $1 "installing nginx"
systemctl enable nginx
validate $1 "enabling nginx"
systemctl start nginx
validate $1 "starting nginx"
rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip
unzip /tmp/frontend.zip
 vim /etc/nginx/default.d/expense.conf