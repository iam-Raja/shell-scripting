#!/bin/bash
USERID=$(id -u)
Timestamp=$(date +%F-%H-%M-%s)
script=$(echo $0|cut -d "." -f1)
log_file=/tmp/$Timestamp-$script.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
#password ExpenseApp@1
echo "Please enter DB password:"
read -s mysql_root_password

if [ $USERID -ne 0 ]
then echo -e " $R switch to root user $N "
exit 1
else echo -e " $G u r rot user $N " 
fi
validate (){ 
    if [ $1 -ne 0 ]
    then echo -e " $2 ...$R failed $N "
    exit 1
    else echo -e " $2 ...$G success $N "
    fi
}

dnf install mysql-server -y &>$log_file
validate $? " installing mysql"
systemctl enable mysqld &>$log_file
validate $? " enabling mysql"
systemctl start mysqld &>$log_file
validate $? " starting mysql"
# mysql_secure_installation --set-root-pass ExpenseApp@1 &>$log_file
# validate $? " setting usid&pwd mysql"

# mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
# VALIDATE $? "Setting up root password"

#Below code will be useful for idempotent nature
mysql -h db.daws78s.online -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
    VALIDATE $? "MySQL Root password Setup"
else
    echo -e "MySQL Root password is already setup...$Y SKIPPING $N"
fi

