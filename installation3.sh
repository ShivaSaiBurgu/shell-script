#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
echo $TIMESTAMP-$SCRIPT_NAME
if [ $USERID -ne 0 ]
then
echo "Please run the script with root user"
else
echo "You are a super user"
fi