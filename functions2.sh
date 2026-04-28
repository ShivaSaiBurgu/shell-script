#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root access"
exit 1
else
echo "You are a super user"
fi
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME
validate() {
if [ $1 -ne 0 ]
then
echo "$2...failure"
exit 1
else
echo "$2...success"
fi
}
dnf install mysql -y >>& $LOGFILE
validate $? "Installion of Mysql"
dnf install git -y
validate $? "Installaion of git"
