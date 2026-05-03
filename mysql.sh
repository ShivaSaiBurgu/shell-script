#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME.log
R="\e[31m"
G="\e[32m"
W="\e[0m"
validate(){
    if [ $1 -ne 0 ]
    then
    echo "$2...$R Failure $W"
    exit 1
    else
    echo -e "$2..$G success $W"
    fi
}
if [ $USERID -ne 0 ]
then
echo "Please run the script with root access"
exit 1
else
echo "You are a root user"
fi
dnf install mysql-server -y &>>$LOGFILE
validate $? "Installation of mysql"
systemctl enable mysqld &>>$LOGFILE
validate $? "Enabling of mysql" 
systemctl start mysqld &>>$LOGFILE
validate $? "starting of mysql"

