#!/bin/bash
USERID=$(id-u)
R="\e[31m"
G="\e[32m"

if [ $USERID -ne 0 ]
then echo -e " $R switch to root user $N"
exit 1
else echo " u r rot user" 