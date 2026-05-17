#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME.log
R="\e[31m"
G="\e[32m"
W="\e[0m"
validate() {
    if [ $1 -eq 0 ]
    then
    echo -e "$2...$G success $W"
    else
    echo -e "$2...$R Failure $W"
    fi
}
USERID=$(id -u)
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
mysql_secure_installation --set-root-pass ExpenseApp@1
validate $? "Root password set up"
