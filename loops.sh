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
    echo -e "$2..$R Failure"
    exit 1
    else
    echo -e "$2..$G success"
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
echo -e "$i...$G already installed $M"
else
dnf install $i -y &>>$LOGFILE
validate $? "Installation of $i"
fi
done


