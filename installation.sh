#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root user"
exit 1
else
echo "you are a root user"
fi
yum install mysql -y
if [ $? -ne 0 ]
then
echo "Mysql not installed"
exit 1
else
echo "mysql installed successfully"
fi