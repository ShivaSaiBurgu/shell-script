#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root access"
else
exit 1
echo "You are a root user"
fi

