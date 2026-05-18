#!/bin/bash
check_root() {
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root access"
else
echo "You are a root user"
fi
}