#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with the rootb access"
else
echo "you are a root user"
fi
validate(){
if [ $1 -ne 0 ]
then
echo "$2..Failure"
else
echo "$2...success"
fi
}
dnf install mysql -y
validate $? "Installing mysql"
dnf install git -y
validate $? "Installing git"