#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"

validate (){ 
    if [ $1 -ne 0 ]
    then echo " $2 ...failed"
    exit 1
    else echo " $2 ...success"
    fi
}

dnf install mysql-server -y 
validate $? " installing mysql"

if [ $USERID -ne 0 ]
then echo -e " $R switch to root user $N "
exit 1
else echo -e " $G u r rot user $N " 
fi
