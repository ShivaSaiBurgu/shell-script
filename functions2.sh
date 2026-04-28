#!/bin/bash
USERID=$(id -u)
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
