#!/bin/bash
USERID=$(id -u)
if [ $USERID -nq 0 ]
then
echo "Please run the script with root user"
else
echo "You are a super user"
fi
dnf install mysql-server -y