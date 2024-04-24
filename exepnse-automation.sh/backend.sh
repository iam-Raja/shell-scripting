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

dnf module disable nodejs -y &>>$log_file
validate $? " disabling default nodejs"
dnf module enable nodejs:20 -y &>?$log_file
validate $? " enabling nodejs"
dnf install nodejs -y &>>$log_file
validate $? " installing nodejs"

id expense  &>>$log_file
if [ $? -ne 0 ]
then useradd expense  &>>$log_file
validate $? "adding user expense"
else
echo -e "expense user is existing $Y ...skipping $N"
fi