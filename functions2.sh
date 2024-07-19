#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

if [ $USERID -ne 0 ]
then
echo "Please run the script with root user access"
exit 1
else
echo "you are a root user"
fi
validate() {
if [ $1 -ne 0 ]
then
echo "$2...Failed"
exit 1
else
echo "$2..success"
fi
}
dnf install mysql -y &>>LOGFILE 
validate $? "Installation of Mysql"
dnf install git -y &>>LOGFILE
validate $? "Installation of git"