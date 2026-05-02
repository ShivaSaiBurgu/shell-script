#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME.log
validate() {
    if [ $1 -eq 0 ]
    then
    echo "$2....success"
    else
    echo "$2...Failure"
    fi
}
dnf install mysql-server -y &>>$LOGFILE
validate $? "Installation of mysql"
dnf install mysql-server -y &>>$LOGFILE
validate $? "Installing MySQL Server"

systemctl enable mysqld &>>$LOGFILE
validate $? "Enabling MySQL Server"

systemctl start mysqld &>>$LOGFILE
validate $? "Starting MySQL Server"