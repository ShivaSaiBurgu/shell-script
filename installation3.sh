#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME
validate() {
if [ $1 -ne 0 ]
then
echo "$2...Installation failed"
else
echo "$2...Installation success"
fi
}
if [ $USERID -ne 0 ]
then
echo "Please run the script with root user"
else
echo "You are a super user"
fi
for i in $@
echo "Installation of $i"
dnf list installed $id
if [ $? -eq 0 ]
then
echo "$i..already installed"
else
dnf install $i -y
validate $? "Installation of $i"