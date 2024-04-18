#!/bin/bash
USERID=$(id -u)

dnf install mysql -y
if [ $? -ne 0]
then
echo "mysql install failed"
exit 1
else
echo "mysql installed successfully"
fi

dnf install git -y

if [ $? -ne 0]
then
echo "git install failed"
exit 1
else
echo "git installed successfully"
fi

if [$USERID -eq 0]
then
echo "you are super user, installed"
else
echo "switch to root....proceed....."
fi