#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME.log
R="\e[31m"
G="\e[32m"
W="\e[33m"
validate(){
    if [ $1 -ne 0 ]
    then
    echo "$2...Failure"
    exit 1
    else
    echo "$2..success"
    fi
}
if [ $USERID -ne 0 ]
then
echo "Please run the script with root access"
exit 1
else
echo "You are a root user"
fi
dnf install mysql-server -y &>>$LOGFILE
validate $? "Installation of mysql"

