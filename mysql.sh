#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root user access"
else
echo "you are a root user"
fi
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0)
echo $SCRIPT_NAME