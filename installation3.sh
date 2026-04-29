#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/-$TIMESTAMP-$SCRIPT_NAME
if [ $USERID -ne 0 ]
then
echo "Please run the script with root user access"
exit 1
else
echo "You are a root user"
fi
for i in $@
do
dnf list installed $i
if [ $? -eq 0 ]
then
echo "$i....already installed"
else
echo "$i...not installed"
done