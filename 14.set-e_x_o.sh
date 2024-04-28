#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
set -x #debug mode
set -e #exit when script error

if [ $USERID -ne 0 ]
then echo -e "$R Switch to super user $N"
else echo -e " $G U R Super User $N"
fi

dnf install git -y
dnf install mysqll -y
echo -e " $G installed git & Mysql $N"

