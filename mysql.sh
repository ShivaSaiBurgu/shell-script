#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME.log
USERID=$(id -u)
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
else
echo "you are a root user"
fi
dnf install mysql-server -y &>>$LOGFILE
validate $? "Installation of mysql"
systemctl enable mysqld &>>$LOGFILE
validate $? "Enabling mysql"
systemctl start mysqld &>>$LOGFILE
validate $? "Starting mysql"

