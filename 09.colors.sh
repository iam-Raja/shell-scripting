#!/bin/bash
USERID=$(id -u)
Timestamp=$(date +%F-%H-%M-%S)
script_name=$(echo $0|cut -d "." -f1)
log_file=/tmp/$script_name-$Timestamp.log
R="\e[31m"
G="\e[32m"
W="\e[0m"

validate(){
    if [ $1 -ne 0 ]
    then echo -e "$2 is $R failed $N"
    exit 1
    else echo -e " $2 is $G success $N"
    fi
}

dnf install mysql -y &>>$log_file
validate "$?" " installing mysql"

dnf install git -y &>>$log_file
validate "$?" " installing git"

dnf install kube -y &>>$log_file
validate "$?" " installing kube"


if [ $USERID -ne 0 ]
then
echo "switch to root....proceed....."
else
echo "u r super user"
fi