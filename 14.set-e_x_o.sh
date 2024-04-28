#!/bin/bash
USERID=$(id -u)

set -x #debug mode
set -e #exit when script error

if [$USERID -ne 0]
then echo "Switch to super user"
else echo "U R Super User"
fi

dnf install git -y
dnf install mysqll -y
echo "installed git & Mysql"

