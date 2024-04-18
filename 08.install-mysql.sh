#!/bin/bash
USERID=$(id -u)
dnf install mysql -y
echo "mysql installed successfully"
dnf install git -y

if [$USERID -eq 0]
then
echo "you are super user, installed"
else
echo "switch to root....proceed....."
fi