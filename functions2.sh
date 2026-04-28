#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root user"
exit 1
else
echo "You are a root user"
fi
dnf install mysql -y
if [ $? -ne 0 ]
then
echo "Installation of mysql...failed"
exit 1
else
echo "Installation of mysql...success"
fi
dnf install git -y
if [ $? -ne 0 ]
then
echo "Installation of git...failed"
exit 1
else
echo "Installation of git...success"
