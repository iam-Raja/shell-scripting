#!/bin/bash
USERID=$(id -u)
Timestamp=$(date +%F-%H-%M-%S)
script_name=$($0|cut -d "." -f1)
log_file=/tmp/$script_name-$Timestamp.log

validate(){
    if [ $? -ne 0 ]
    then echo "$2 is failed"
    exit 1
    else echo " $2 is success "
    fi
}

dnf install mysql -y &>>$log_file
validate "$?" " installing mysql"

dnf install git -y &>>$log_file
validate "$?" " installing git"

if [$USERID -ne 0]
then
echo "switch to root....proceed....."
else
echo "u r super user"
fi