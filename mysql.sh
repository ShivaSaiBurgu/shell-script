#!/bin/bash
$USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root Access"
exit 1
else
echo "You are a root user"
fi
time=$(date +%F-%H-%M-%S)
script=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$time-$script.log
VALIDATE()
{
    if [ $? -ne 0 ]
    then
    echo "$1...Failure"
    else
    echo "$2...success"
    fi
}
yum install mysql -y &>>$LOGFILE
VALIDATE $? "Installing mysql"
systemctl enable mysqld
VALIDATE $? "Enabling mysql"
systemctl start mysqld
VALIDATE $? "Starting mysql"
mysql_secure_installation --set-root-pass ExpenseApp@1
VALIDATE $? "password setup" 




