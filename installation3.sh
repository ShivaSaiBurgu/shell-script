#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "please run the script with root access"
exit 1
else
echo "You are a super user"
fi
validate() {
    if [ $1 -eq 0 ]
    then
    echo "$2....success"
    else
    echo "$2...failure"
    fi
}
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME
R="\e[31m"
G="\e[32m"
dnf list installed $@ &>>$LOGFILE
for i in $@
do
if [ $? -eq 0 ]
then
echo -e "$G $i...already installed $M"
else
dnf install $i -y &>>$LOGFILE
validate $? "Installation of $i"
fi
done