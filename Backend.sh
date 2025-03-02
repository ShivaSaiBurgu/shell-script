#!/bin/bash
time=$(date +%F-%H-%M-%S)
script=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$time-$script.log
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "please run the script with root access"
exit 1
else
echo "You are a root user"
fi

validate()
{
    if [ $1 -ne 0 ]
    then
    echo "$2...Failure"
    exit 1
    else
    echo "$2...success"
    fi
}
dnf module disable nodejs -y &>>$LOGFILE
validate $? "Disabling nodejs"
dnf module enable nodejs:20 -y &>>$LOGFILE
validate $? "Enabling nodejs"
dnf install nodejs -y &>>$LOGFILE
validate $? "Installing nodejs"
id expense &>>$LOGFILE
if [ $? -ne 0 ]
then
useradd expense &>>$LOGFILE
else
echo "user exists"
fi
mkdir -p /app
validate $? "created /app directory"
curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOGFILE
validate $? "Downloading code"