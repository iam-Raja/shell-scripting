#!/bin/bash
USERID=$(id -u)

validate(){
    if [ $? -ne 0]
    then echo "$2 is failed"
    exit 1
    else echo " $2 is success "
    fi
}
dnf install mysql -y

validate "$?" " installing mysql"

dnf install git -y
validate "$?" " installing git"

if [$USERID -ne 0]
then
echo "switch to root....proceed....."
else
echo "u r super user"
fi