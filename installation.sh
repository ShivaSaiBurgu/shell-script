#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root user"
exit 1
else
echo "You are a super user"
fi
dnf install mysql-server -y
if [ $? -ne 0 ]
then
echo "Installaion of mysql....Failed"
exit 1
else
echo "Installation of mysql....success"
fi
echo "Hello world"