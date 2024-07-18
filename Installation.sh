#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
echo "Please run the script using root access"
exit 1
else
echo "You are a root user"
fi
yum install mysql -y
if [ $? -ne 0 ]
then
echo "Installation not occurred"
exit 1
else
echo "Installed mysql server"
fi

