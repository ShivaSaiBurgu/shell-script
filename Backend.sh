#!/bin/bash
time=$(date +%F-%H-%M-%S)
script=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$time-$script.log
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please run the script with root access"
else
echo "You are a root user"
fi
validate()
{
    if [ $1 -ne 0 ]
    then
    echo "$2...Failure"
    else
    echo "$2...success"
    fi
}
dnf module disable nodejs -y &>>$LOGFILE
validate $? "Disabling nodejs"
dnf module enable nodejs:20 -y &>>$LOGFILE
validate $? "Enabling nodejs:20"
dnf install nodejs -y &>>$LOGFILE
validate $? "Installing nodejs"
id expense &>>$LOGFILE
if [ $? -ne 0 ]
then
useradd expense &>>$LOGFILE
else
echo "expense user already created"
fi
mkdir -p /app &>>$LOGFILE
validate $? "created app directory"
curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOGFILE
cd /app &>>$LOGFILE
rm -rf /app/*
unzip /tmp/backend.zip &>>$LOGFILE
npm install
systemctl daemon-reload
systemctl start backend
systemctl enable backend
dnf install mysql -y
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pExpenseApp@1 < /app/schema/backend.sql
systemctl restart backend &>>$LOGFILE