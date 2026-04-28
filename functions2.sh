#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$($0 | cut -d "." -f1)
echo "$TIMESTAMP and $SCRIPT_NAME"
LOGFILE=/tmp/
validate() {
if [ $1 -ne 0 ]
then
echo "$2...failure"
exit 1
else
echo "$2...success"
fi
}
if [ $USERID -ne 0 ]
then
echo "Please run the script with root user"
exit 1
else
echo "You are a root user"
fi
dnf install mysql -y
validate $? "Installion of Mysql"
dnf install git -y
validate $? "Installaion of git"
