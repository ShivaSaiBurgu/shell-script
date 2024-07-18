#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with the rootb access"
else
echo "you are a root user"
fi