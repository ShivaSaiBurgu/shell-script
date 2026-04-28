#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME
R="\e[31m"
G="\e[32m"
M="\e[0m"
validate() {
    if [ $1 -ne 0 ]
    then
    echo "$2..Failure"
    exit 1
    else
    echo "$2..success"
    fi
}
if [ $USERID -ne 0 ]
then
echo "Please run the script with root user access"
exit 1
else
echo "You are a root user"
fi
for i in $@
do
echo "package to install: $i"
dnf list installed $i &>>$LOGFILE
if [ $? -eq 0 ]
then
echo -e "$i...$R already installed $M"
else
echo -e "$i...$G not installed $M"
fi
done


