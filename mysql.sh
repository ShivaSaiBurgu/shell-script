#!/bin/bash
USERID=$(id -u)
TIME=$(date +%F-%H-%M-%S)
script=$(echo $0 | cut -d "." -f1)
LOGFILE=$TIME-$script.log
if [ $USERID -ne 0 ]
then
echo "Please run the script with root user"
exit 1
else
echo "You are a root user"
fi
validate()
{
    if [ $1 -ne 0 ]
    then
    echo "$2....Failure"
    else
    echo "$2...success"
    fi
}
dnf install mysql-server -y &>>$LOGFILE
validate $? "mysql-server-installaion"
systemctl enable mysqld 
dnf install mysql-server -y &>>$LOGFILE
validate $? "enabling mysql-server" 
dnf install mysql-server -y &>>$LOGFILE
systemctl start mysqld
validate $? "starting mysql-server" 
dnf install mysql-server -y &>>$LOGFILE
mysql_secure_installation --set-root-pass ExpenseApp@1
validate $? "password setup"



