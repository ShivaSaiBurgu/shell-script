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
dnf install mysql-server -y 
validate $? "Installation of mysql"

systemctl enable mysqld 
validate $? "Enabling MySQL Server"

systemctl start mysqld 
validate $? "Starting MySQL Server"

mysql_secure_installation --set-root-pass ExpenseApp@1 
validate $? "Setting up root password"