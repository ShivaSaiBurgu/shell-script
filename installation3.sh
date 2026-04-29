#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/-$TIMESTAMP-$SCRIPT_NAME
validate() {
    if [ $1 -eq 0 ]
    then
    echo "$2...success"
    else
    echo "$2...Failure"
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
dnf list installed $i &>>$LOGFILE
if [ $? -eq 0 ]
then
echo "$i....already installed"
else
dnf install -y $i &>>$LOGFILE
validate $? "Installation of $i"
fi
done