#!/bin/bash
USERID=$(id -u)
dnf install mysql -y
echo "mysql installed successfully"

if [$USERID -eq 0]
then
echo "you are super user"
else
echo "switch to root....proceed....."