#!/bin/bash
USERID=$(id -u)
validate() {
    if [ $? -ne 0 ]
    then
    echo "$2...Failed"
    exit 1
    else
    echo "$2...Success"
    fi

}
if [ $USERID -ne 0 ]
then
echo "Please run the script with root access"
exit 1
else
echo "You are a super user"
fi
dnf install mysql-server -y
validate $? "Installation of Mysql"
dnf install git -y
validate $? "Installation of git"