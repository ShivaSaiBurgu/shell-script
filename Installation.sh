#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run this script using root user access"
else
echo "You are a root user"
fi
dnf install mysql -y
if [ $? -ne 0 ]
then
echo "Installation of mysql has failed"
exit 1
fi